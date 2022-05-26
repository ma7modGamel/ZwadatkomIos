//
//  ViewController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit
import Combine

protocol SplashViewProtocol: BaseController {
    var onCompleteSplashPublisher: PassthroughSubject <Void, Never> { get }
}

class SplashController: UIViewController, SplashViewProtocol {
    
    var onCompleteSplashPublisher = PassthroughSubject <Void, Never> ()
    
    private var subscriptions = Set<AnyCancellable>()
    private var viewModel: SplashViewModelProtocol!
    
    init(viewModel: SplashViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let splashView = SplashView()
        self.view = splashView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onFinishSetDataPublisher
            .delay(for: .milliseconds(1), scheduler: RunLoop.main)
            .sink{ [weak self] _ in
                guard let self = self else { return }
                self.onCompleteSplashPublisher.send()
            } receiveValue: { _ in }
            .store(in: &subscriptions)
    }
    
    private func setTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.onCompleteSplashPublisher.send()
        }
    }
}
