//
//  LoginController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 17/05/2022.
//

import UIKit
import Combine

protocol LoginViewProtocol : BaseController {
    var onRegisterTapPublisher: PassthroughSubject<Void, Never> { get }
    var onToOTPVerificationPublisher: PassthroughSubject<Void, Never> { get}
}

class LoginController: UIViewController, LoginViewProtocol {
    
    var onToOTPVerificationPublisher = PassthroughSubject<Void, Never>()
    var onRegisterTapPublisher = PassthroughSubject<Void, Never>()
    
    
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: LoginViewModelProtocol!
    private var loginView: LoginView!
    
    init(viewModel: LoginViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let loginView = LoginView()
        self.loginView = loginView
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
extension LoginController {
    private func bindToDataStreamsAndUserInteractions() {
        bindToRegister()
        bindToLogin()
        
        bindToEmailTextField()
        bindToPasswordTextField()
        bindToHasNoSavedAddress()
        bindToNotVerified()
    }
    
    private func bindToEmailTextField() {
        loginView.usernameTextField.textPublisher.assign(to: \.email, on: viewModel).store(in: &subscriptions)
    }
    private func bindToPasswordTextField() {
        loginView.passwordTextField.textPublisher.assign(to: \.password, on: viewModel).store(in: &subscriptions)
    }
    
    private func bidToSkip() {
        
    }
    
    private func bindToLogin() {
        loginView.loginButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.tryToLogin()
        }.store(in: &subscriptions)
    }
    
    private func bindToRegister() {
        loginView.registerButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.onRegisterTapPublisher.send()
        }.store(in: &subscriptions)
    }
    
    private func bindToNotVerified() {
        viewModel.notVerifiedPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.onToOTPVerificationPublisher.send()
        }.store(in: &subscriptions)
    }
    private func bindToHasNoSavedAddress() {
        viewModel.hasNoAddressPublisher.sink { [weak self] _ in
            
        }.store(in: &subscriptions)
    }
}
