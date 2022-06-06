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
    enum HomeItem: Hashable {
        case banner(Banner)
        case category(Category)
        case product(Product)
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<HomeSection, HomeItem>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<HomeSection, HomeItem>
    private var dataSource: DataSource!
    
    private var viewModel: SearchViewModelProtocol!
    private weak var homeView: HomeView! {
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
        let homeView = HomeView()
        self.homeView = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        configureDataSource()
//        bindToDataStreamsAndUserInteractions()
        print("with did load \(String(describing: self)) with count of subscriptions \(subscriptions.count) ")
    }
}
