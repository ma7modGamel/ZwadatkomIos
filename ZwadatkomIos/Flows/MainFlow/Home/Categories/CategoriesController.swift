//
//  CategoriesController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import UIKit
import Combine

protocol CategoriesControllerProtocol: BaseController {
    var onTapOnCategory: PassthroughSubject<(selectedCategory: Category, categoriesList: [Category]), Never> { get }
}

class CategoriesController: BaseUIViewController, CategoriesControllerProtocol {
    //----------------------------------------------------------------------------------------------------------------
    // MARK: - Coordinator helpers  ...
    //----------------------------------------------------------------------------------------------------------------
    var onTapOnCategory: PassthroughSubject = PassthroughSubject<(selectedCategory: Category, categoriesList: [Category]), Never>()
    //----------------------------------------------------------------------------------------------------------------
    // MARK: - Proprieties  ...
    //----------------------------------------------------------------------------------------------------------------
    enum Section: Hashable {
        case main
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Category>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Category>
    private var dataSource: DataSource!
    
    private var viewModel: CategoriesViewModelProtocol!
    private weak var categoriesView: CategoriesView! {
        willSet {
            self.view = newValue
            self.baseView = newValue
        }
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: CategoriesViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let categoriesView = CategoriesView()
        self.categoriesView = categoriesView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        bindToDataStreamsAndUserInteractions()
        print("with did load \(String(describing: self)) with count of subscriptions \(subscriptions.count) ")
    }
}
extension CategoriesController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
        bindToCategoriesList()
    }

    private func bindToCategoriesList() {
        viewModel.categoriesListPublisher.sink { [weak self] categoriesList in
            guard let self = self else { return }
            var snapshot = DataSourceSnapshot()
            snapshot.appendSections([.main])
            snapshot.appendItems(categoriesList, toSection: .main)
            DispatchQueue.main.async {
                self.dataSource.apply(snapshot)
            }
        }.store(in: &subscriptions)
    }
    
    private func configureDataSource() {
        dataSource = DataSource(collectionView: categoriesView.categoriesCollectionView)  { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.largeCategoryCell, for: indexPath) as! LargeCategoryCell
            cell.configure(with: itemIdentifier)
            cell.tapSubscriptionCancelableToken = cell.tapGesture.tapPublisher.sink { [weak self] _ in
                guard let self = self else { return }
                let categoriesList = self.viewModel.categoriesListPublisher.value
                self.onTapOnCategory.send((selectedCategory: itemIdentifier, categoriesList: categoriesList))
            }
            return cell
        }
        dataSource.supplementaryViewProvider = { ( collectionView , kind, indexPath) in
            let supplementaryView = collectionView.dequeueReusableSupplementaryView( ofKind: kind,
                                                                                     withReuseIdentifier: SectionsHeaders.sectionHeader,
                                                                                     for: indexPath) as! SectionHeaderView
            supplementaryView.sectionTitle = L10n.categorySectionTitle
            return supplementaryView
        }
    }

    private func snapshotForCurrentState() -> DataSourceSnapshot {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([.main])
        return snapshot
    }
}
