//
//  RegisterController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit
import Toast

protocol RegisterViewProtocol: BaseController {
    
}

class RegisterController: BaseUIViewController, RegisterViewProtocol {
    
    private var viewModel: RegisterViewModelProtocol!
    private var registerView: RegisterView!
    
    override func loadView() {
        let registerView = RegisterView()
        self.baseView = registerView
        self.registerView = registerView
        self.view = registerView
    }
    
    init(viewModel: RegisterViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension RegisterController {
    private func bindToDataStreamsAndUserInteractions() {
        bindToRegister()
        
        bindToEmailTextField()
        bindToPasswordTextField()
        bindToError()
    }
    
    private func bindToEmailTextField() {
        registerView.usernameTextField.textPublisher.assign(to: \.emailAddress, on: viewModel).store(in: &subscriptions)
    }
    private func bindToPasswordTextField() {
        registerView.passwordTextField.textPublisher.assign(to: \.password, on: viewModel).store(in: &subscriptions)
    }
    
    private func bidToSkip() {
        
    }
    
    private func bindToRegister() {
        registerView.loginButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.tryToRegister()
        }.store(in: &subscriptions)
    }

    private func bindToError() {
        viewModel.errorPublisher.sink { errorAsString in
            let toast = Toast.text(errorAsString)
            toast.show()
        }.store(in: &subscriptions)
    }
}
