//
//  ViewController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit
import Combine


protocol SplashViewProtocol: BaseView {
    var onCompleteSplashPublisher: PassthroughSubject <Void, Never> { get }
}


class SplashController: UIViewController, SplashViewProtocol {
    var onCompleteSplashPublisher = PassthroughSubject <Void, Never> ()

    override func loadView() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

