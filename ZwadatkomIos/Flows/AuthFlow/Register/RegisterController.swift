//
//  RegisterController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit

protocol RegisterViewProtocol: BaseController {
    
}

class RegisterController: UIViewController, RegisterViewProtocol {
    
    private var viewModel: RegisterViewModelProtocol!
    private var registerView: RegisterView!
    
    override func loadView() {
        let registerView = RegisterView()
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
