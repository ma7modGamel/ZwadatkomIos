//
//  OrderDetailsController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 05/06/2022.
//

import UIKit
import Combine

protocol OrderDetailsControllerProtocol: BaseController {
}


class OrderDetailsController: BaseUIViewController, OrderDetailsControllerProtocol {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------
    internal var onOrderTapPublisher = PassthroughSubject<Order, Never>()
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    enum Section: Hashable {
        case main
    }
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Order>
    private typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Order>
    private var dataSource: DataSource!
    private var viewModel: OrderDetailsViewModelProtocol!
    private var orderDetailsView: OrderDetailsView! {
        willSet {
            self.view = newValue
            self.baseView = newValue
        }
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: OrderDetailsViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let orderDetailsView = OrderDetailsView()
        self.orderDetailsView = orderDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
    }
}
extension OrderDetailsController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
        bindToOrderDataStream()
    }
    
    private func bindToOrderDataStream() {
        viewModel.productPublisher.sink { [weak self] order in
            guard let self = self else { return }
            print(order)
            self.orderDetailsView.configureView(with: order)
        }.store(in: &subscriptions)
    }
}
