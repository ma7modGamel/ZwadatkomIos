//
//  ApplicationCoordinator.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit
import Combine

fileprivate var ishAuthHasBeenSkipped: Bool {
    get {
       false //return UserDefaultsManager.shared().isUserSkippedAuthenticateFlow
    }
}

fileprivate var splashHasBeenShowed: Bool = false

fileprivate enum LaunchInstructor {
    case splash, onboarding, main, auth
    
    static func configure(isSplashWasShown: Bool = splashHasBeenShowed, authSkipped: Bool = ishAuthHasBeenSkipped) -> LaunchInstructor {
            
            switch (isSplashWasShown, authSkipped) {
            case (false, false), (false, true):
                return .splash
            case (true, false):
                return .auth
            case (true, true):
                return .main
            }
        }
}

class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(with option: DeepLinkOption?) {
        //start with deepLink
        if let option = option {
            switch option {
            case .splash: runSplashFlow()
            case .register: runAuthFlow()
            default: childCoordinators.forEach { coordinator in
                coordinator.start(with: option)
            }
            }
            // default start
        } else {
            switch instructor {
            case .splash: runSplashFlow()
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
    }
    
    private func runSplashFlow() {
        let coordinator = coordinatorFactory.createSplashCoordinator(router: router)
        coordinator.finishFlowPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            splashHasBeenShowed = true
            self.start()
            self.removeDependency(coordinator)
        }.store(in: &subscriptions)
        
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runOnboardingFlow() {
        
    }
    
    private func runAuthFlow() {

    }
    
    private func runMainFlow() {
//        let (coordinator, module) = coordinatorFactory.createTabBarCoordinator()
//        coordinator.onCartIsTapped.sink { [weak self] in
//            guard let self = self else { return }
//            self.runCartFlow()
//            print(self)
//        }.store(in: &subscriptions)
//        addDependency(coordinator)
//        router.setRootModule(module, hideBar: true)
//        coordinator.start()
    }
    
//    private func runCartFlow() {
//        let (coordinator, module) = coordinatorFactory.makeCartCoordinatorBox()
//        addDependency(coordinator)
//        router.present(module)
//        coordinator.start()
//    }
    
}
