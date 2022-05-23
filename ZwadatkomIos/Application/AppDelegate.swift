//
//  AppDelegate.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit
import MOLH

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }
    
    private lazy var applicationCoordinator: Coordinator = self.createApplicationCoordinator()
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        configureNavigationAppearance()
        configureMOLH()
        
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
    
    private func configureNavigationAppearance() {
        let backIndicatorImage = UIImage(asset: Asset.backIndicator)?.withRenderingMode(.alwaysOriginal)
        
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.setBackIndicatorImage(backIndicatorImage, transitionMaskImage: backIndicatorImage)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private func configureMOLH() {
        MOLHLanguage.setDefaultLanguage("ar")
        MOLH.shared.activate(true)
    }
    
}

