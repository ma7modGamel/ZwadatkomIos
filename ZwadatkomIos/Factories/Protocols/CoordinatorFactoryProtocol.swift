//
//  CoordinatorFactoryProtocol.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit

protocol CoordinatorFactoryProtocol: AnyObject {
    func createSplashCoordinator(router: RouterProtocol) -> Coordinator & SplashCoordinatorOutput
    func createOnboardingCoordinator(router: RouterProtocol) -> Coordinator & OnboardingCoordinatorOutput
    func createAuthCoordinator(router: RouterProtocol) -> Coordinator & AuthCoordinatorOutput
    func createTabBarCoordinator(router:RouterProtocol, coordinatorFactory: MainCoordinatorFactory) -> Coordinator & TapBarCoordinatorOutput
}

protocol MainCoordinatorFactory: AnyObject  {
    func createHomeCoordinator(navController: UINavigationController) -> Coordinator & HomeCoordinatorOutput
    func createCartCoordinator(navController: UINavigationController) -> Coordinator & SettingsCoordinatorOutput
    func createSettingsCoordinator(navController: UINavigationController) -> Coordinator & SettingsCoordinatorOutput
}
