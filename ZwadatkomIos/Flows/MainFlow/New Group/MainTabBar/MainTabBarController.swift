//
//  File.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import UIKit
import Combine

protocol TabBarViewProtocol: AnyObject {
    var homeNavigationPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
    var servicesNavigationPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
    var accountNavigationPublisher: CurrentValueSubject<UINavigationController?, Never> { get }
}

class MainTabBarController: UITabBarController, TabBarViewProtocol {

    var homeNavigationPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)
    var servicesNavigationPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)
    var accountNavigationPublisher = CurrentValueSubject<UINavigationController?, Never>(nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabItemAppearance()
        setTabBarNavigationsControllers()
        delegate = self
        selectedIndex = 0
        if let controller = customizableViewControllers?.first as? UINavigationController {
            homeNavigationPublisher = CurrentValueSubject<UINavigationController?, Never>(controller)

        }
    }

    class func create() -> MainTabBarController {
        let tabBar = MainTabBarController()
        return tabBar
    }

    private func setTabBarNavigationsControllers() {
        let homeNavigation = UINavigationController()
        let servicesNavigation = UINavigationController()
        let accountNavigation = UINavigationController()
//        homeNavigation.tabBarItem = customTabBarItem(title: L10n.home, imageName: L10n.homeTab)
//        servicesNavigation.tabBarItem = customTabBarItem(title: L10n.servicesCategories, imageName: L10n.servicesTab)
//        accountNavigation.tabBarItem = customTabBarItem(title: L10n.account, imageName: L10n.accountTab)

        self.viewControllers = [homeNavigation, servicesNavigation, accountNavigation]
        self.selectedIndex = 0
    }

    private func setTabItemAppearance() {
        let appearance = UITabBarItem.appearance()
        let normalAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.bold, size: 16)]
        appearance.setTitleTextAttributes(normalAttributes as [NSAttributedString.Key: Any], for: .normal)
    }

    private func customTabBarItem(title: String, imageName: String) -> UITabBarItem {
        let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
        let image = UIImage(systemName: imageName, withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        let selected = image?.withTintColor(ColorName.lightGray.color)
        let normal = image?.withTintColor(ColorName.blackColor.color)
        let customTabBarItem: UITabBarItem = UITabBarItem(title: title, image: normal, selectedImage: selected)
        // customTabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        return customTabBarItem
    }

}

extension MainTabBarController: UITabBarControllerDelegate {

    private enum ControllerIndexes: Int {
        case home = 0
        case services = 1
        case account = 2
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        switch ControllerIndexes(rawValue: selectedIndex) {
        case .services:
            servicesNavigationPublisher.send(controller)
        case .account:
            accountNavigationPublisher.send(controller)
        default:
            return
        }
    }
}
