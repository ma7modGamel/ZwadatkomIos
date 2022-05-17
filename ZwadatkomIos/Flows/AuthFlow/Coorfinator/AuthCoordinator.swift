//
//  AuthCoordinator.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 17/05/2022.
//

import Foundation
import Combine

protocol AuthCoordinatorOutput: AnyObject {
    var finishFlowPublisher: PassthroughSubject<Void, Never> { get }
}

class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    
    var finishFlowPublisher = PassthroughSubject<Void, Never>()
    
    private let factory: AuthModuleFactory
    private weak var router: RouterProtocol!
    
    init(router: RouterProtocol, factory: AuthModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    private func showLogin() {
        let loginOutput = factory.createLoginOutput()
//        loginOutput.onCompleteSplashPublisher.sink { [weak self] _ in
//            guard let self = self else { return }
//            self.finishFlowPublisher.send()
//        }.store(in: &subscriptions)
        router.setRootModule(loginOutput)
    }
}
