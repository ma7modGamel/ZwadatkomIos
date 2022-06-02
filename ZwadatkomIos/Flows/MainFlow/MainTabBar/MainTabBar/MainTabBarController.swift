//
//  File.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import UIKit
import Combine

protocol TabBarViewProtocol: AnyObject {
}

class MainTabBarController: UITabBarController, TabBarViewProtocol {
            
    static let tabBarTabsCount: Int = 2
    var middleButtonTapPublisher: AnyCancellable?
    private enum TabBarNavigationsTags: Int {
        case main = 1
        case settings = 2
    }
    
    init(tabBarControllersCount: Int) {
        super.init(nibName: nil, bundle: nil)
        var controllers = [UINavigationController]()
        for tag in 1 ... MainTabBarController.tabBarTabsCount {
            let navigationController = UINavigationController()
            navigationController.view.tag = tag
            setTabBarItemForController(controller: navigationController)
            controllers.append(navigationController)
        }
        self.viewControllers = controllers
        self.selectedIndex = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func setTabBarItemForController(controller: UIViewController) {
        guard let controllerTag = TabBarNavigationsTags(rawValue: controller.view.tag) else { return }
        switch controllerTag {
        case .main:
            controller.tabBarItem = customTabBarItem(normalImage: Asset.homeTabIcon)
        case .settings:
            controller.tabBarItem = customTabBarItem(normalImage: Asset.settingsTabIcon)
        }
    }
    
    private func customTabBarItem(normalImage: ImageAsset) -> UITabBarItem {
        let normalImage = UIImage(asset: normalImage)
        let selectedImage = normalImage?.withTintColor(ColorName.red.color, renderingMode: .alwaysOriginal)
        let customTabBarItem: UITabBarItem = UITabBarItem(title: nil, image: normalImage, selectedImage: selectedImage)
        return customTabBarItem
    }
}
