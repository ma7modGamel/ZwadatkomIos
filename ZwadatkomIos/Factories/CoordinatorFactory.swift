//
//  CoordinatorFactory.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//


import UIKit


final class CoordinatorFactory: CoordinatorFactoryProtocol {

    func createTabBarCoordinator() -> (configurator: Coordinator & TapBarCoordinatorOutput, toPresent: Presentable?) {
        let controller = MainTabBarController.create()
        let coordinator = TabBarCoordinator(tabBarView: controller, coordinatorFactory: CoordinatorFactory())
        return (coordinator, controller)
    }

    func createSplashCoordinator(router: RouterProtocol) -> Coordinator & SplashCoordinatorOutput {
        let coordinator = SplashCoordinator(router: router, factory: ModuleFactory())
        return coordinator
    }

    func createOnboardingCoordinator(router: RouterProtocol) -> Coordinator & OnboardingCoordinatorOutput {
        let coordinator = OnboardingCoordinator(router: router, factory: ModuleFactory())
        return coordinator
    }
    
    func createAuthCoordinator(router: RouterProtocol) -> AuthCoordinatorOutput & Coordinator {
        let coordinator = AuthCoordinator(router: router, factory: ModuleFactory())
        return coordinator
    }

    private func router(_ navController: UINavigationController?) -> RouterProtocol {
        return Router(rootController: navigationController(navController))
    }
    
    
    
    
    private func navigationController(_ navController: UINavigationController?) -> UINavigationController {
        if let navController = navController { return navController }
        else { return UINavigationController() }
    }
    

}
