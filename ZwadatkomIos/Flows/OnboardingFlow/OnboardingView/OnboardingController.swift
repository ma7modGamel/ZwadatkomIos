//
//  OnboardingController.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 16/05/2022.
//

import Combine
import CombineCocoa
import UIKit

protocol OnboardingViewProtocol: BaseView {
    var onCompleteSplashPublisher: PassthroughSubject <Void, Never> { get }
}

class OnboardingController: UIViewController, OnboardingViewProtocol {
    
    var onCompleteSplashPublisher = PassthroughSubject<Void, Never>()
    
    private var subscriptions = Set<AnyCancellable>()
    private var onboardingView: OnboardingView!
    private var viewModel: OnboardingViewModelProtocol!
    
    init(viewModel: OnboardingViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        let onboardingView = OnboardingView()
        self.onboardingView = onboardingView
        self.view = onboardingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUserInterActionsAndDateFlows()
    }
}
extension OnboardingController {
    private func bindUserInterActionsAndDateFlows() {
        bindToViewCurrentValueDataStream()
        bindToNextButtonTap()
    }
    
    private func bindToViewCurrentValueDataStream() {
        viewModel.onboardingValuePublisher.sink { [weak self] completion in
            guard let self = self else { return }
            print("flow has been finished")
        } receiveValue: { [weak self] currentValue in
            guard let self = self else { return }
            self.onboardingView.currentViewValuePublisher.send(currentValue)
        }.store(in: &subscriptions)
    }
    
    private func bindToNextButtonTap() {
        onboardingView.nextButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.viewModel.getNextValuePublisher.send()
        }.store(in: &subscriptions)
    }
    
}
