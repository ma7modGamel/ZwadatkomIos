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
    
    init(tabBarControllersCount: Int) {
        super.init(nibName: nil, bundle: nil)
        

        
        var controllers = [UINavigationController]()
        for tag in 1 ... MainTabBarController.tabBarTabsCount {
            let navigationController = UINavigationController()
            navigationController.tabBarItem = customTabBarItem(normalImage: Asset.homeTabIcon, selectedImage: Asset.homeTabIcon)
            navigationController.view.tag = tag
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
        let tabBar = { () -> MainTabBar in
            let tabBar = MainTabBar()
            tabBar.delegate = self
            return tabBar
        }()
        self.setValue(tabBar, forKey: "tabBar")
        setupMiddleButton()
    }

    
    // TabBarButton – Setup Middle Button
        func setupMiddleButton() {
            guard let image = UIImage(asset: Asset.tabBarMiddleButton) else { return }

            let tabBarMiddleButton = UIButton(frame: CGRect(x: (self.view.bounds.width / 2)-25, y: -20, width: 50, height: 50))
            tabBarMiddleButton.setImageForAllStates(image)

            
            self.tabBar.addSubview(tabBarMiddleButton)
            tabBarMiddleButton.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

            self.view.layoutIfNeeded()
        }

        // Menu Button Touch Action
        @objc func menuButtonAction(sender: UIButton) {
            print("self.selectedIndex = 2")
            self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
        }

    private func customTabBarItem(normalImage: ImageAsset, selectedImage: ImageAsset) -> UITabBarItem {
        let normalImage = UIImage(asset: normalImage)
        let selectedImage = UIImage(asset: selectedImage)?.withTintColor(.blue)
        let customTabBarItem: UITabBarItem = UITabBarItem(title: nil, image: normalImage, selectedImage: selectedImage)
        // customTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        return customTabBarItem
    }
}

