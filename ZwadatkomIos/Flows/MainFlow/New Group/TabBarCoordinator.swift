//
//  TabBarCoordinator.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import UIKit
import Combine

final class TabBarCoordinator: BaseCoordinator, TapBarCoordinatorOutput {

    private (set) var onCartIsTapped = PassthroughSubject<Void, Never>()
    private let tabBarView: TabBarViewProtocol
    private let coordinatorFactory: CoordinatorFactory

    init(tabBarView: TabBarViewProtocol, coordinatorFactory: CoordinatorFactory) {
        self.tabBarView = tabBarView
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
        runHomeFlow()
        runServicesFlow()
        runAccountFlow()
    }

    private func runHomeFlow() {
        tabBarView.homeNavigationPublisher.sink { navController in
//            guard let navController = navController else { return }
//            guard navController.viewControllers.isEmpty else { return }
//            let coordinator = self.coordinatorFactory.createHomeCoordinator(navController: navController)
//            coordinator.onCartIsTapped.sink { [weak self] _ in
//                guard let self = self else { return }
//                self.onCartIsTapped.send()
//            }.store(in: &self.subscriptions)
//            self.addDependency(coordinator)
//            coordinator.start()
//            self.tabBarView.homeNavigationPublisher.send(completion: .finished)
        }.store(in: &subscriptions)
    }

    private func runServicesFlow() {
        tabBarView.servicesNavigationPublisher.sink { [weak self] navController in
//            guard let self = self else { return }
//            guard let navController = navController else { return }
//            guard navController.viewControllers.isEmpty else { return }
//            let coordinator = self.coordinatorFactory.createServicesCoordinator(navController: navController)
//            self.addDependency(coordinator)
//            coordinator.start()
//            self.tabBarView.servicesNavigationPublisher.send(completion: .finished)

        }.store(in: &subscriptions)
    }

    private func runAccountFlow() {
        tabBarView.accountNavigationPublisher.sink { navController in
//            guard let navController = navController else { return }
//            guard navController.viewControllers.isEmpty else { return }
//            let coordinator = self.coordinatorFactory.createAccountCoordinator(navController: navController)
//            self.addDependency(coordinator)
//            coordinator.start()
//            self.tabBarView.accountNavigationPublisher.send(completion: .finished)
        }.store(in: &subscriptions)
    }
}
