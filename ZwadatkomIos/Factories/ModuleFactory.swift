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
