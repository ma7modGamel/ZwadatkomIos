//
//  CoordinatorFactoryProtocol.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func createSplashCoordinator(router: RouterProtocol) -> Coordinator & SplashCoordinatorOutput
    func createOnboardingCoordinator(router: RouterProtocol) -> Coordinator & OnboardingCoordinatorOutput
    func createAuthCoordinator(router: RouterProtocol) -> Coordinator & AuthCoordinatorOutput
}
