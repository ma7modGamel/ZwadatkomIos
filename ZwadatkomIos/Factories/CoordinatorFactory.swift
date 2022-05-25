//
//  CoordinatorFactory.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//


import UIKit


final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    func createTabBarCoordinator(router:RouterProtocol, coordinatorFactory: MainCoordinatorFactory) -> Coordinator & TapBarCoordinatorOutput {
        let moduleFactory = ModuleFactory()
        let coordinator = TabBarCoordinator(router: router, factory: moduleFactory, coordinatorFactory: coordinatorFactory)
        return coordinator
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

extension CoordinatorFactory: MainCoordinatorFactory {
    func createHomeCoordinator(navController: UINavigationController) -> Coordinator & HomeCoordinatorOutput {
        let coordinator = HomeCoordinator(router: router(navController), factory: ModuleFactory())
        return coordinator
    }
    
    func createCartCoordinator(navController: UINavigationController) -> Coordinator & SettingsCoordinatorOutput {
        let coordinator = SettingsCoordinator(router: router(navController), factory: ModuleFactory())
        return coordinator
    }
    
    func createSettingsCoordinator(navController: UINavigationController) -> Coordinator & SettingsCoordinatorOutput {
        let coordinator = SettingsCoordinator(router: router(navController), factory: ModuleFactory())
        return coordinator
    }
    
}
