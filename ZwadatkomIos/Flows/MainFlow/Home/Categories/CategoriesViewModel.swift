//
//  CategoriesViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import Foundation
import Combine

protocol CategoriesViewModelProtocol: AnyObject {
    var categoriesListPublisher: CurrentValueSubject<[Category], Never> { get }
}

class CategoriesViewModel: CategoriesViewModelProtocol {
    
    let categoriesListPublisher: CurrentValueSubject<[Category], Never>
    
    init(categories: [Category]) {
        self.categoriesListPublisher = CurrentValueSubject<[Category], Never>(categories)
    }
    
}
