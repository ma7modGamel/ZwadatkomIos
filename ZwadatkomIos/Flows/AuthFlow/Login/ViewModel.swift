//
//  ViewModel.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 17/05/2022.
//

import Foundation
import Combine

protocol LoginViewModelProtocol: AnyObject {
    var password: String? { get set }
    var email: String? { get set }
    var notVerifiedPublisher: PassthroughSubject<Void, Never> { get }
    var hasNoAddressPublisher: PassthroughSubject<Void, Never> { get }
    var verifiedUser: PassthroughSubject<Void, Never> { get }

    
    func tryToLogin()
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private var subscription = Set<AnyCancellable>()
    internal var notVerifiedPublisher = PassthroughSubject<Void, Never>()
    internal var hasNoAddressPublisher = PassthroughSubject<Void, Never>()
    internal var verifiedUser = PassthroughSubject<Void, Never>()
    
    var password: String?
    var email: String?
    
    init() {
        
    }
    
    func tryToLogin() {
        let loginModel = LoginModel(email: email, password: password)
        NetworkManager.shared().login(with: loginModel).sink { completion in
            
        } receiveValue: { [weak self] value in
            guard let self = self else { return }
            switch value.success {
            case true:
                guard ((value.user?.address.isEmpty) != nil) else {
                    return
                }
                
            case false:
                guard value.token != nil else {
                    self.notVerifiedPublisher.send()
                    return
                }
                
            }
        }.store(in: &subscription)
    }
    
    
    
    
}
