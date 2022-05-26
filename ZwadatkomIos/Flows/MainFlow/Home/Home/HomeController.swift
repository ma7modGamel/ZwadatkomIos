//
//  HomeController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit

protocol HomeControllerProtocol: BaseController {
    
}

final class HomeController: BaseUIViewController, HomeControllerProtocol {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator helpers ...
    //----------------------------------------------------------------------------------------------------------------
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    enum Section: String, CaseIterable {
      case featuredAlbums = "Featured Albums"
      case sharedAlbums = "Shared Albums"
      case myAlbums = "My Albums"
    }
    private typealias DataSource = UICollectionViewDiffableDataSource<HomeSection, String>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<HomeSection, String>
    private var dataSource: DataSource!
    
    private var viewModel: HomeViewModelProtocol!
    private var homeView: BaseUIView!
    
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
        super.loadView()
        let homeView = HomeView()
        self.baseView = homeView
        self.homeView = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
    }
}
extension HomeController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {

    }
    
    private func configureDataSource() {
        
    }
}
