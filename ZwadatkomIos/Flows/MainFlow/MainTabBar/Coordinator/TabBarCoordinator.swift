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
        print("##### starting tab bar coordinator #####")
        let tabBarController = factory.createTabBarOutput()
        guard let tabBarNavigationControllers = tabBarController.viewControllers else { fatalError("error due failed to setup tap bar")}
        tabBarNavigationControllers.forEach { controller in
            print("set root controllers for \(controller.description)")
            guard let controllerTag = TabBarNavigationsTags(rawValue: controller.view.tag) else { return }
            switch controllerTag {
            case .main:
                print("##### sets home controller for first tab navigation controller #####")
                setHomeFlow(navController: controller as! UINavigationController)
            case .settings:
                print("##### sets home controller for second tab navigation controller #####")
                setSettingsFlow(navController: controller as! UINavigationController )
            }
        }
        router.setRootModule(tabBarController, hideBar: true)
    }

    private func setHomeFlow(navController: UINavigationController) {
        print("set home flow  ....")
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
    }
}
