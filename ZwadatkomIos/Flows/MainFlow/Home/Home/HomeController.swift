//
//  HomeController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit
import Combine

protocol HomeControllerProtocol: BaseController {
    var onShowAllCategoriesTap: PassthroughSubject<[Category], Never> { get }
    var onsSearchTap: PassthroughSubject<Void, Never> { get }
}

final class HomeController: BaseUIViewController, HomeControllerProtocol {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator helpers ...
    //----------------------------------------------------------------------------------------------------------------
    let onShowAllCategoriesTap = PassthroughSubject<[Category], Never>()
    let onsSearchTap = PassthroughSubject<Void, Never>()
    let onProductTap = PassthroughSubject<Void, Never>()
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    enum HomeItem: Hashable {
        case banner(Banner)
        case category(Category)
        case product(Product)
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<HomeSection, HomeItem>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeItem>
    private var dataSource: DataSource!
    
    private var viewModel: HomeViewModelProtocol!
    private weak var homeView: HomeView! {
        willSet {
            self.view = newValue
            self.baseView = newValue
        }
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: HomeViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let homeView = HomeView()
        self.homeView = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        bindToDataStreamsAndUserInteractions()
        print("with did load \(String(describing: self)) with count of subscriptions \(subscriptions.count) ")
    }
}
extension HomeController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
        bindToBannersList()
        bindToCategoriesList()
        bindToProductsListDataFlow()
        bindToSearchButtonTap()
    }
    
    private func bindToSearchButtonTap() {
        homeView.searchButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.onsSearchTap.send()
        }.store(in: &subscriptions)
    }
    
    private func bindToMenuButtonTap() {
        homeView.menuButton.tapPublisher.sink { _ in
            print("Menu button has been tapped")
        }.store(in: &subscriptions)
    }

    private func bindToBannersList() {
        viewModel.bannersListPublisher
            .map { banners in
                banners.map({HomeItem.banner($0)})
            }.sink { items in
                self.updateDataSource(with: items, in: .Banners)
            }.store(in: &subscriptions)
    }

    private func bindToCategoriesList() {
        viewModel.categoriesListPublisher
            .map({ $0.map({ HomeItem.category($0) }) })
            .sink { [weak self] items in
                guard let self = self else { return }
                print(items)
                self.updateDataSource(with: items, in: .Categories)
            }.store(in: &subscriptions)
    }

    private func bindToProductsListDataFlow() {
        viewModel.productsListPublisher
            .map({ $0.map({ HomeItem.product($0) }) })
            .sink { [weak self] items in
                guard let self = self else { return }
                print("Products ListData : \n \(items)")
                self.updateDataSource(with: items, in: .Products)
            }.store(in: &subscriptions)
    }

    private func updateDataSource(with homeItems: [HomeItem], in section: HomeSection) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(homeItems, toSection: section)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot)
        }
    }

    private func configureDataSource() {
        dataSource = DataSource(collectionView: homeView.homeCollectionView)  { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .banner(let banner):
//                print("##### creating banner cell #####")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.bannerCell, for: indexPath) as! BannerCell
                cell.configure(with: banner)
                return cell
            case .category(let category):
//                print("##### creating category cell #####")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.categoryCell, for: indexPath) as! CategoryCell
                cell.configure(with: category)
                return cell
            case .product(let product):
//                print("##### creating product cell #####")
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.productCell, for: indexPath) as! ProductCell
                cell.configure(with: product)
                return cell
            }
        }

        dataSource.supplementaryViewProvider = { [weak self] ( collectionView , kind, indexPath) in
            guard let self = self else { return nil }
            let sectionLayoutKind = HomeSection.allCases[indexPath.section]
            switch (sectionLayoutKind) {
            case .Categories:
                let supplementaryView = collectionView.dequeueReusableSupplementaryView( ofKind: kind,
                                                                                         withReuseIdentifier: SectionsHeaders.categoryHeader,
                                                                                         for: indexPath) as! CategoryHeaderView
                supplementaryView.titleLAbel.text = L10n.categorySectionTitle
                supplementaryView.tapCancelableToken = supplementaryView.viewCategoriesButton.tapPublisher.sink { ss in
                    print("show all categories has been pressed")
                    let categoriesList = self.viewModel.categoriesListPublisher.value
                    self.onShowAllCategoriesTap.send(categoriesList)
                }
                return supplementaryView
            case .Products:
                let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                        withReuseIdentifier: SectionsHeaders.sectionHeader,
                                                                                        for: indexPath) as! SectionHeaderView
                supplementaryView.sectionTitle = L10n.newestProductsSection
                return supplementaryView
            default:
                return nil
            }
          }
        let snapshot = snapshotForCurrentState()
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func snapshotForCurrentState() -> DataSourceSnapshot {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections(HomeSection.allCases)
        return snapshot
    }
}
