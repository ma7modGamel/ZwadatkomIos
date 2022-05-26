//
//  TabBarCoordinator.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import UIKit
import Combine

final class TabBarCoordinator: BaseCoordinator, TapBarCoordinatorOutput {
    
    private enum TabBarNavigationsTags: Int {
        case main = 1
        case settings = 2
    }

    private (set) var onCartIsTapped = PassthroughSubject<Void, Never>()
    
    private var factory: TabBarModuleFactory
    private weak var router: RouterProtocol!
    private weak var coordinatorFactory: MainCoordinatorFactory!
    
    init(router: RouterProtocol, factory: ModuleFactory, coordinatorFactory: MainCoordinatorFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router  = router
        self.factory = factory
    }

    override func start() {
        let tabBarController = factory.createTabBarOutput()
        guard let tabBarNavigationControllers = tabBarController.viewControllers else { fatalError("error due failed to setup tap bar")}
        tabBarNavigationControllers.forEach { controller in
            guard let controllerTag = TabBarNavigationsTags(rawValue: controller.view.tag) else { return }
            switch controllerTag {
            case .main:
                setHomeFlow(navController: controller as! UINavigationController)
            case .settings:
                setSettingsFlow(navController: controller as! UINavigationController )
            }
        }
        router.setRootModule(tabBarController, hideBar: true)
    }

    private func setHomeFlow(navController: UINavigationController) {
        let coordinator = coordinatorFactory.createHomeCoordinator(navController: navController)
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func setSettingsFlow(navController: UINavigationController) {
        let coordinator = coordinatorFactory.createSettingsCoordinator(navController: navController)
        addDependency(coordinator)
        coordinator.start()
    }

    private func setCartFlow() {
//        let coordinator = coordinatorFactory.
//        tabBarView.servicesNavigationPublisher.sink { [weak self] navController in
//            guard let self = self else { return }
//            guard let navController = navController else { return }
//            guard navController.viewControllers.isEmpty else { return }
//            let coordinator = self.coordinatorFactory.createServicesCoordinator(navController: navController)
//            self.addDependency(coordinator)
//            coordinator.start()
//            self.tabBarView.servicesNavigationPublisher.send(completion: .finished)
//        }.store(in: &subscriptions)
    }
}
