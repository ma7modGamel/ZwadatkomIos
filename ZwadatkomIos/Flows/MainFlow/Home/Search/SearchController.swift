//
//  SearchController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 06/06/2022.
//

import UIKit
import Combine

protocol SearchControllerProtocol: BaseController {
    var onShowAllCategoriesTap: PassthroughSubject<[Category], Never> { get }
    var onsSearchTap: PassthroughSubject<Void, Never> { get }
}

final class SearchController: BaseUIViewController, SearchControllerProtocol {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator helpers ...
    //----------------------------------------------------------------------------------------------------------------
    let onShowAllCategoriesTap = PassthroughSubject<[Category], Never>()
    let onsSearchTap = PassthroughSubject<Void, Never>()
    let onProductTap = PassthroughSubject<Void, Never>()
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private typealias DataSource = UICollectionViewDiffableDataSource<SearchSection, Product>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<SearchSection, Product>
    private var dataSource: DataSource!
    
    private var viewModel: SearchViewModelProtocol!
    private weak var searchView: SearchView! {
        willSet {
            self.view = newValue
            self.baseView = newValue
        }
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: SearchViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let searchView = SearchView()
        self.searchView = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        bindToDataStreamsAndUserInteractions()
    }
}

extension SearchController {
    private func bindToDataStreamsAndUserInteractions() {
        bindToSearchResultStateStream()
        bindToSearchText()
    }
    
    private func bindToSearchText() {
        searchView.searchBar.searchTextField.textPublisher
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .compactMap( { $0 })
            .sink { [weak self] searchKeyword in
                guard let self = self else { return }
                self.viewModel.searchKeyWordPublisher.send(searchKeyword)
            }.store(in: &subscriptions)
    }
    
    private func bindToSearchResultStateStream() {
        viewModel.searchResultStatePublisher.sink { searchResultState in
            var snapshot = DataSourceSnapshot()
            switch searchResultState {
            case .hasResult(let products):
                snapshot.appendSections([.searchResult])
                snapshot.appendItems(products)
            case .noResult(let products):
                snapshot.appendSections([.noResult])
                snapshot.appendItems(products)
            }
            self.updateDataSource(with: snapshot)
        }.store(in: &subscriptions)
    }
    
    private func updateDataSource(with snapshot: DataSourceSnapshot) {
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func configureDataSource() {
        dataSource = DataSource(collectionView: searchView.searchCollectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.productCell, for: indexPath) as! ProductCell
            cell.configure(with: itemIdentifier)
            return cell
        }
        dataSource.supplementaryViewProvider = { [weak self] ( collectionView , kind, indexPath) in
            guard let self = self else { return nil }
            let supplementaryViewType = supplementaryViewTypes(rawValue: kind)
            switch supplementaryViewType {
            case .sectionHeader:
                let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                        withReuseIdentifier: SectionsHeaders.sectionHeader,
                                                                                        for: indexPath) as! SectionHeaderView
                supplementaryView.sectionTitle = self.viewModel.sectionName
                return supplementaryView
            case .noResultHeaderView:
                let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                        withReuseIdentifier: SectionsHeaders.sectionHeader,
                                                                                        for: indexPath)
                guard !self.dataSource.snapshot().sectionIdentifiers.contains(.noResult) else { return supplementaryView }
                (supplementaryView as! NoResultHeaderView).removeSubviews()
                return supplementaryView
            default:
                return nil
            }
        }
    }
}

enum SearchSection: Hashable, CaseIterable {
    case searchResult
    case noResult
}
