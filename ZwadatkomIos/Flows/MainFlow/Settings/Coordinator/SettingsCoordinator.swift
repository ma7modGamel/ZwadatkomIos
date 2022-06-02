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
        router.setRootModule(settingsOutput)
    }
    
    private func showPersonalInformation() {
        print("showPersonalInformation")
    }
}

