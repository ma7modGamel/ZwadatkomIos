//
//  LoginController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 17/05/2022.
//

import UIKit
import Combine

protocol LoginViewProtocol : BaseView {
    
}

class LoginController: UIViewController, LoginViewProtocol {
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}
