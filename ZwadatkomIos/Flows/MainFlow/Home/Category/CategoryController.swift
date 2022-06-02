//
//  CategoryController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import UIKit
import Combine
import SwiftUI

protocol CategoryControllerProtocol: BaseController {
    var onShowAllCategoriesTap: PassthroughSubject<[Category], Never> { get }
}

class CategoryController: BaseUIViewController, CategoryControllerProtocol {
    
    //----------------------------------------------------------------------------------------------------------------
    // MARK: -  Coordinator helpers ...
    //----------------------------------------------------------------------------------------------------------------
    var onShowAllCategoriesTap = PassthroughSubject<[Category], Never>()
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    
    enum CategoryItem: Hashable {
        case categories(Category)
        case products(Product)
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<CategorySection, CategoryItem>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<CategorySection, CategoryItem>
    private var dataSource: DataSource!
    
    private var viewModel: CategoryViewModelProtocol!
    private weak var categoryView: CategoryView! {
        willSet {
            self.view = newValue
            self.baseView = newValue
        }
    }
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: CategoryViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let categoryView = CategoryView()
        self.categoryView = categoryView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        bindToDataStreamsAndUserInteractions()
    }
}
extension CategoryController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
        bindToProductsListDataFlow()
        bindToCategoriesList()
    }

    private func bindToCategoriesList() {
        viewModel.categoriesListPublisher
            .map({ $0.map({ CategoryItem.categories($0) }) })
            .sink { [weak self] items in
                guard let self = self else { return }
                print(items)
                self.updateDataSource(with: items, in: .categories)
            }.store(in: &subscriptions)
    }

    private func bindToProductsListDataFlow() {
        viewModel.productsListPublisher
            .map({ $0.map({ CategoryItem.products($0) }) })
            .sink { [weak self] items in
                guard let self = self else { return }
                self.updateDataSource(with: items, in: .products)
            }.store(in: &subscriptions)
    }

    private func updateDataSource(with homeItems: [CategoryItem], in section: CategorySection) {
        var snapshot = dataSource.snapshot()
        snapshot.deleteSections([section])
        snapshot.appendSections([section])
        snapshot.appendItems(homeItems, toSection: section)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot)
        }
    }

    private func configureDataSource() {
        dataSource = DataSource(collectionView: categoryView.categoryCollectionView)  { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .categories(let category):
                print("##### creating banner cell #####")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.categoryCell, for: indexPath) as! CategoryCell
                cell.tapSubscriptionCancelableToken = cell.tapGesture.tapPublisher.sink { [weak self] _ in
                    guard let self = self else { return }
                    self.viewModel.selectedCategoryPublisher.send(category)
                }
                cell.configure(with: category)
                return cell
            case .products(let product):
                print("##### creating category cell #####")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.productCell, for: indexPath) as! ProductCell
                cell.configure(with: product)
                return cell
            }
        }
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func snapshotForCurrentState() -> DataSourceSnapshot {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections(CategorySection.allCases)
        return snapshot
    }
}
