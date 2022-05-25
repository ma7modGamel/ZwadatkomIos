//
//  Coordinator.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

protocol SettingsCoordinatorOutput: AnyObject {
    
}

class SettingsCoordinator: BaseCoordinator, SettingsCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: SettingsModuleFactory
    
    init(router: RouterProtocol, factory: SettingsModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        let settingsOutput = factory.createSettingsOutput()
        router.setRootModule(settingsOutput)
    }
}

