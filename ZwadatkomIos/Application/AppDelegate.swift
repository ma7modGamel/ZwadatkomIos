//
//  AppDelegate.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    var rootController: UINavigationController {
        return UINavigationController()
    }



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {





        return true
    }
    
    private func createApplicationCoordinator() -> ApplicationCoordinator {
        let router = Router(rootController: rootController)
        let coordinatorFactory = CoordinatorFactory()
        return ApplicationCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    }

}

