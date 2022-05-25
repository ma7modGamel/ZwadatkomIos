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
    var verifiedUserPublisher: PassthroughSubject<Void, Never> { get }
    var errorPublisher: PassthroughSubject<String,  Never> { get }

    
    func tryToLogin()
}

final class LoginViewModel: LoginViewModelProtocol {
    
    
    private var subscription = Set<AnyCancellable>()
    internal var notVerifiedPublisher = PassthroughSubject<Void, Never>()
    internal var hasNoAddressPublisher = PassthroughSubject<Void, Never>()
    internal var verifiedUserPublisher = PassthroughSubject<Void, Never>()
    internal var errorPublisher = PassthroughSubject<String, Never>()

    var password: String?
    var email: String?
    
    init() {
        
    }
    
    func tryToLogin() {
        let loginModel = LoginModel(email: email, password: password)
        NetworkManager.shared().login(with: loginModel).sink { completion in
            print(completion)
        } receiveValue: { [weak self] response in
            guard let self = self else { return }
            guard let message = response.message else {
                return
                
            }
            self.errorPublisher.send(message)
//            self.errorPublisher.send(message)
//            guard let errors = response.errors else {
//                switch response.success {
//                case true:
//                    guard ((response.user?.address.isEmpty) != nil) else {
//                        return
//                    }
//                    self.saveUserToken(token: response.token)
//                    UserDefaultsManager.shared().isAuthFinished = true
//                    self.verifiedUserPublisher.send()
//                default:
//                    guard response.token != nil else {
//
//                        return
//                    } // show message
//                    self.notVerifiedPublisher.send()
//                }
//                return
//            }
//            self.errorHasOccurred(errors: errors)
        }.store(in: &subscription)
    }
    
    private func errorHasOccurred(errors: [String: [String]]) {
        guard let errors = errors.first else { return }
        guard let firstError = errors.value.first else { return }
        self.errorPublisher.send(firstError)
    }
    
    private func saveUserToken(token: String?) {
        UserDefaultsManager.shared().token = token
    }
}
