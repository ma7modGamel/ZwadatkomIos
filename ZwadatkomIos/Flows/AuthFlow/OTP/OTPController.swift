//
//  OTPController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit

protocol OTPViewProtocol: BaseController {
    
}

class OTPController: BaseUIViewController, OTPViewProtocol {
    
    private var otpView: OTPView!
    private var viewModel: OTPViewModelProtocol!
    
    init(viewModel: OTPViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let otpView = OTPView()
        self.baseView = otpView
        self.otpView = otpView
        self.view = otpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
