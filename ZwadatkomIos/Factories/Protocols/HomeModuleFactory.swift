//
//  HomeModuleFactory.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation

protocol HomeModuleFactory {
    func createHomeOutput() -> HomeControllerProtocol
    func createCategoriesHandler(with categories: [Category]) -> CategoriesControllerProtocol
    func createCategoryHandler(with categories: [Category], and selectedCategory: Category) -> CategoryControllerProtocol
}
