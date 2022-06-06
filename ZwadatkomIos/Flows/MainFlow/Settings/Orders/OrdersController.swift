//
//  OrdersController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit
import Combine

protocol OrdersControllerProtocol: BaseController {
    var onOrderTapPublisher: PassthroughSubject<Int, Never> { get }
}

class OrdersController: BaseUIViewController, OrdersControllerProtocol {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------
    internal var onOrderTapPublisher = PassthroughSubject<Int, Never>()
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    enum Section: Hashable {
        case main
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Order>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Order>
    private var dataSource: DataSource!
    private var viewModel: OrdersViewModelProtocol!
    private var ordersView: OrdersView! {
        willSet {
            self.view = newValue
            self.baseView = newValue
        }
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: OrdersViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let ordersView = OrdersView()
        self.ordersView = ordersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        bindToDataStreamsAndUserInteractions()
    }
}
extension OrdersController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
        bindToOrdersListDataStream()
    }
    private func bindToOrdersListDataStream() {
        viewModel.ordersListPublisher.sink { [weak self] ordersList in
            guard let self = self else { return }
            self.updateDataSource(with: ordersList)
        }.store(in: &subscriptions)
    }
    
    private func updateDataSource(with data: [Order]) {
        var snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.main])
        snapshot.appendItems(data, toSection: .main)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    private func configureDataSource()  {
        dataSource = DataSource(collectionView: ordersView.ordersCollectionView) { [weak self] tableView, indexPath, itemIdentifier in
            guard let self = self else { return nil }
            guard let cell = tableView.dequeueReusableCell(withReuseIdentifier: Cells.orderCell, for: indexPath) as? OrderCell else {
                fatalError("Cant dequeueReusable Cell for tableView in controller: \(self.description)")
            }
            print("order collection view dequeued cell ")
            cell.configure(with: itemIdentifier)
            cell.orderTapGesture.tapPublisher.sink { [weak self] _ in
                guard let self = self else { return }
                self.onOrderTapPublisher.send(itemIdentifier.id)
            }.store(in: &self.subscriptions)
            return cell
        }
    }
}
