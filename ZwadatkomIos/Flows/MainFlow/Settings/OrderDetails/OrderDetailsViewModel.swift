//
//  OrderDetailsViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 05/06/2022.
//

import Foundation
import Combine

protocol OrderDetailsViewModelProtocol: AnyObject {
    var productPublisher: PassthroughSubject<Order, Never> { get }
}

class OrderDetailsViewModel: OrderDetailsViewModelProtocol {
    
    let productPublisher = PassthroughSubject<Order, Never>()
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(orderId: Int) {
        self.privateFuncFetchOrderDetails(by: orderId)
    }
    
    func privateFuncFetchOrderDetails(by orderId: Int) {
        NetworkManager.shared().getOrder(by: orderId).sink { completion in
            
        } receiveValue: { [weak self] response in
            guard let self = self else { return }
            guard response.success else { return }
            self.productPublisher.send(response.order)
        }.store(in: &subscriptions)

    }
}
