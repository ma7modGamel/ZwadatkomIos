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
        return UserDefaultsManager.shared().isAuthFinished
    }
}

fileprivate var onboardingHasBeenShowed: Bool {
    get {
        return UserDefaultsManager.shared().isBoardingShowed
    }
}

fileprivate var splashHasBeenShowed: Bool = false

fileprivate enum LaunchInstructor {
    case splash, onboarding, main, auth
    
    static func configure(isSplashWasShown: Bool = splashHasBeenShowed,
                          isOnboardingWasShown: Bool = onboardingHasBeenShowed,
                          authSkipped: Bool = ishAuthHasBeenSkipped) -> LaunchInstructor {
        
        switch (isSplashWasShown, isOnboardingWasShown ,authSkipped) {
        case (false, _, _):
            return .splash
        case (true, false, _):
            return .onboarding
        case (true, true, true):
            return .main
        case (true, true, false):
            return .auth
        }
    }
}

class ApplicationCoordinator: BaseCoordinator {
    
    private let coordinatorFactory: CoordinatorFactory
    private let router: RouterProtocol
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactory) {
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
        let coordinator = coordinatorFactory.createOnboardingCoordinator(router: router)
        coordinator.finishFlowPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.start()
            self.removeDependency(coordinator)
        }.store(in: &subscriptions)
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runAuthFlow() {
        let coordinator = coordinatorFactory.createAuthCoordinator(router: router)
        coordinator.finishFlowPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.removeDependency(coordinator)
            self.start()
        }.store(in: &subscriptions)
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let coordinator = coordinatorFactory.createTabBarCoordinator(router: router, coordinatorFactory: coordinatorFactory)
        addDependency(coordinator)
        coordinator.start()
    }
}
