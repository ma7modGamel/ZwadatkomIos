//
//  RegisterViewModel.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import Foundation
import Combine

protocol RegisterViewModelProtocol: AnyObject {
    var password: String? { get set }
    var emailAddress: String? { get set }
    
    var errorPublisher: PassthroughSubject<String,  Never> { get }
    func tryToRegister()
}
class RegisterViewModel: RegisterViewModelProtocol {
    var email: String?
    
    var errorPublisher = PassthroughSubject<String, Never>()
    
    
    
    var name: String?
    var emailAddress: String?
    var mobileNumber: String?
    var password: String?
    var passwordConfirm: String?
    
    init() {
        
    }
    
    func tryToRegister() {
        let registerModel = RegisterModel()
        NetworkManager.shared().register().sink { completion in
            
        } receiveValue: { response in
            
        }
    }
    
}
