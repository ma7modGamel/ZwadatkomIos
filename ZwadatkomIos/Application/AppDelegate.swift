//
//  AppDelegate.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = self.createApplicationCoordinator()
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        
        applicationCoordinator.start()
        
        return true
    }
    
    private func createApplicationCoordinator() -> ApplicationCoordinator {
        let router = Router(rootController: rootController)
        let coordinatorFactory = CoordinatorFactory()
        return ApplicationCoordinator(router: router, coordinatorFactory: coordinatorFactory)
    }
    
}

