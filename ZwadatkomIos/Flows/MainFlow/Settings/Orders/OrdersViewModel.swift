//
//  OrdersViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import Foundation
import Combine

protocol OrdersViewModelProtocol: AnyObject {
    var ordersListPublisher: CurrentValueSubject<[Order], Never> { get }

}

class OrdersViewModel: OrdersViewModelProtocol {
    
    private var subscriptions = Set<AnyCancellable>()
    let ordersListPublisher = CurrentValueSubject<[Order], Never>([Order]())
    
    
    init() {
        getOrders()
    }
    
    private func getOrders() {
        NetworkManager.shared().getOrders().sink { completion in
            
        } receiveValue: { [weak self] response in
            guard let self = self else { return }
            guard case true = response.success else { return }
            self.ordersListPublisher.send(response.orders.data)
        }.store(in: &subscriptions)

    }
}
