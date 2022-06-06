//
//  Coordinator.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

protocol SettingsCoordinatorOutput: AnyObject {
    
}

final class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: SettingsModuleFactory
    
    init(router: RouterProtocol, factory: SettingsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        let settingsOutput = factory.createSettingsOutput()
        settingsOutput.onPersonalTapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.showPersonalInformation()
        }.store(in: &subscriptions)
        settingsOutput.onOrdersTapPublisher.sink { [weak self]_ in
            guard let self = self else { return }
            self.showOrders()
        }.store(in: &subscriptions)
        router.setRootModule(settingsOutput)
    }
    
    private func showPersonalInformation() {
        let personalInformationHandler = factory.createPersonalInformationHandler()
        router.push(personalInformationHandler, hideBottomBar: true)
    }
    private func showOrders() {
        let ordersHandler = factory.createOrdersHandler()
        ordersHandler.onOrderTapPublisher.sink { [weak self] orderId in
            guard let self = self else { return }
            self.showOrder(with: orderId)
        }.store(in: &subscriptions)
        router.push(ordersHandler, hideBottomBar: true)
    }
    
    private func showOrder(with orderId: Int) {
        let orderDetailsHandler = factory.createOrderDetailsHandler(for: orderId)
        router.push(orderDetailsHandler, hideBottomBar: true)
        
    }
}

