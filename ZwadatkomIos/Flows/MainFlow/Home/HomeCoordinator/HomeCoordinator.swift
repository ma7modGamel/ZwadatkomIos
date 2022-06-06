//
//  HomeCoordinator.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation

protocol HomeCoordinatorOutput: AnyObject {
    
}

class HomeCoordinator: BaseCoordinator, HomeCoordinatorOutput {
    
    private let router: RouterProtocol
    private let factory: HomeModuleFactory
    
    init(router: RouterProtocol, factory: HomeModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        let homeOutput = factory.createHomeOutput()
        homeOutput.onShowAllCategoriesTap.sink { [weak self] categoriesList in
            guard let self = self else { return }
            self.showCategories(categories: categoriesList)
        }.store(in: &subscriptions)
        homeOutput.onsSearchTap.sink { [weak self] _ in
            guard let self = self else { return }
            self.showSearch()
        }.store(in: &subscriptions)
        router.setRootModule(homeOutput)
    }
    
    private func showCategories(categories: [Category]) {
        let categoriesHandler = factory.createCategoriesHandler(with: categories)
        categoriesHandler.onTapOnCategory.sink { [weak self] values in
            guard let self = self else { return }
            self.showCategory(selected: values.selectedCategory, categoriesList: values.categoriesList)
        }.store(in: &subscriptions)
        self.router.push(categoriesHandler, hideBottomBar: true)
    }
    
    private func showCategory(selected: Category, categoriesList: [Category]) {
        let categoryHandler = factory.createCategoryHandler(with: categoriesList, and: selected)
        self.router.push(categoryHandler, hideBottomBar: false)
    }
    
    private func showSearch() {
       // let searchHandler =
    }
}

