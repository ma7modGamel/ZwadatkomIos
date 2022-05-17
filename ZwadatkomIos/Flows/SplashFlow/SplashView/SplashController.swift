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
        let splashView = SplashView()
        self.view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTimer()
    }
    
    private func setTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.onCompleteSplashPublisher.send()
        }
    }
}
