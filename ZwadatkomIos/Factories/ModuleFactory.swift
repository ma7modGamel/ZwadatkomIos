//
//  ModuleFactory.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import Foundation


final class ModuleFactory {
    

}

extension ModuleFactory: SplashModuleFactory {
    func createSplashOutput() -> SplashViewProtocol {
        let viewController = SplashController()
        return viewController
    }
}

extension ModuleFactory: OnboardingModuleFactory {
    func createOnboardingOutput() -> OnboardingViewProtocol {
        let viewModel = OnboardingViewModel()
        let viewController = OnboardingController(viewModel: viewModel)
        return viewController
    }
}

extension ModuleFactory: AuthModuleFactory {
    func createLoginOutput() -> LoginViewProtocol {
        let viewModel = LoginViewModel()
        let viewController = LoginController(viewModel: viewModel)
        return viewController
    }

    func createRegisterHandler() -> RegisterViewProtocol {
        let viewModel = RegisterViewModel()
        let viewController = RegisterController(viewModel: viewModel)
        return viewController
    }
    
    func createOTPHandler() -> OTPViewProtocol {
        let viewModel = OTPViewModel()
        let viewController = OTPController(viewModel: viewModel)
        return viewController
    }
}

extension ModuleFactory: TabBarModuleFactory {
    func createTabBarOutput() -> MainTabBarController {
        let tabBarControllersCount = 3
        let tabBarController = MainTabBarController(tabBarControllersCount: tabBarControllersCount)
        return tabBarController
    }
}

extension ModuleFactory: HomeModuleFactory {
    func createHomeOutput() -> HomeControllerProtocol {
        let viewModel = HomeViewModel()
        let viewController = HomeController(viewModel: viewModel)
        return viewController
    }
}

extension ModuleFactory: SettingsModuleFactory {
    func createSettingsOutput() -> SettingsController {
        let viewModel = SettingsViewModel()
        let viewController = SettingsController(viewModel: viewModel)
        return viewController
    }
    
}
