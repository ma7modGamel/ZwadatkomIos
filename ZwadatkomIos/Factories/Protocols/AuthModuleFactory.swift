//
//  AuthModuleFactory.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 17/05/2022.
//

import Foundation

protocol AuthModuleFactory {
    
    func createLoginOutput() -> LoginViewProtocol
    func createRegisterHandler() -> RegisterViewProtocol
    func createOTPHandler() -> OTPViewProtocol

    
    
}
