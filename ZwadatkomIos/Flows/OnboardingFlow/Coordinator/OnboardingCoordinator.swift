//
//  OnboardingCoordinator.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 16/05/2022.
//

import Foundation
import Combine

protocol OnboardingCoordinatorOutput: AnyObject {
    var finishFlowPublisher: PassthroughSubject<Void, Never> { get }
}

class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {
    
    var finishFlowPublisher = PassthroughSubject<Void, Never>()
    
    private let factory: OnboardingModuleFactory
    private weak var router: RouterProtocol!
    
    init(router: RouterProtocol, factory: OnboardingModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showSplash()
    }
    
    //MARK: - Run current flow's controllers
    private func showSplash() {
        let onboardingOutput = factory.createOnboardingOutput()
        onboardingOutput.onCompleteSplashPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.finishFlowPublisher.send()
        }.store(in: &subscriptions)
        router.setRootModule(onboardingOutput)
    }
}
