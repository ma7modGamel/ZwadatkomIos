//
//  OnboardingViewModel.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 16/05/2022.
//

import Foundation
import Combine




protocol OnboardingViewModelProtocol: AnyObject {
    typealias onboardingValue = (imageAsset: ImageAsset, title: String, content: String)
    
    
    var getNextValuePublisher: PassthroughSubject<Void, Never> { get }
    var onboardingValuePublisher: CurrentValueSubject<onboardingValue, Never> { get }
}

class OnboardingViewModel: OnboardingViewModelProtocol {
    
    var onboardingValuePublisher: CurrentValueSubject<onboardingValue, Never>
    var getNextValuePublisher = PassthroughSubject<Void, Never>()
    
    private var subscriptions = Set<AnyCancellable>()
    private var dataList: [(imageAsset: ImageAsset, title: String, content: String)] = [
        (Asset.onboarding1st, L10n.onboarding1stTitle, L10n.onboarding1stContent),
        (Asset.onboarding2nd, L10n.onboarding2ndTitle, L10n.onboarding2ndContent),
        (Asset.onboarding3rd, L10n.onboarding3rdTitle, L10n.onboarding3rdContent),
    ]
    private var currentValueIndex = 0
    
    
    init() {
        let initialValue = dataList[currentValueIndex]
        onboardingValuePublisher = CurrentValueSubject<onboardingValue, Never>(initialValue)
        setupGetNextPipeLine()
    }
    
    private func setupGetNextPipeLine() {
        getNextValuePublisher.sink { [weak self] _ in
            guard let self = self else { return }
            let nextValueIndex = self.currentValueIndex + 1
            guard let nextValue = self.dataList[safe: nextValueIndex] else {
                self.finishOnboardingFlow()
                return
            }
            self.onboardingValuePublisher.send(nextValue)
            self.currentValueIndex = nextValueIndex
        }.store(in: &subscriptions)
    }
    
    private func finishOnboardingFlow() {
        UserDefaultsManager.shared().isBoardingShowed = true
        onboardingValuePublisher.send(completion: .finished)
    }
    
}
