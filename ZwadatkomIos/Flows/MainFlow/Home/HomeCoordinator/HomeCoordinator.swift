//
//  HomeCoordinator.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation

protocol HomeCoordinatorOutput: AnyObject {
    
}

class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: HomeModuleFactory
    
    init(router: RouterProtocol, factory: HomeModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        let homeOutput = factory.createHomeOutput()
        router.setRootModule(homeOutput)
    }
}

