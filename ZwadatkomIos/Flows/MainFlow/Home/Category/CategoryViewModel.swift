//
//  CategoryViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import Foundation
import Combine

protocol CategoryViewModelProtocol: AnyObject {
    var productsListPublisher: CurrentValueSubject<[Product], Never> { get }
    var categoriesListPublisher: CurrentValueSubject<[Category], Never> { get }
    var selectedCategoryPublisher: CurrentValueSubject<Category, Never> { get }
}

class CategoryViewModel: CategoryViewModelProtocol {
    
    private var subscriptions  = Set<AnyCancellable>()
    var categoriesListPublisher: CurrentValueSubject<[Category], Never>
    var productsListPublisher = CurrentValueSubject<[Product], Never>([Product]())
    var selectedCategoryPublisher: CurrentValueSubject<Category, Never>

    init(selectedCategory: Category, categoriesList: [Category]) {
        categoriesListPublisher = CurrentValueSubject<[Category], Never>(categoriesList)
        selectedCategoryPublisher = CurrentValueSubject<Category, Never>(selectedCategory)
        bindToSelectedCategory()
    }
    
    func bindToSelectedCategory() {
        selectedCategoryPublisher.sink { [weak self] selectedCategory in
            guard let self = self else { return }
            self.fetchProducts(for: selectedCategory.id)
            var categories = self.categoriesListPublisher.value
            if let index = categories.firstIndex(where: ({ $0.id == selectedCategory.id}) ) {
                categories[index].isSelected = true
            }
            self.categoriesListPublisher.send(categories)
        }.store(in: &subscriptions)
    }
    

    private func fetchProducts(for categoryId: Int) {
        NetworkManager.shared().getProducts(inCategory: [categoryId]).sink { completion in
            guard case .failure = completion else { return }
            self.productsListPublisher.value.removeAll()
        } receiveValue: { [weak self] response in
            guard let self = self else { return }
            guard response.success else { return }
            self.productsListPublisher.send(response.products.data)
        }.store(in: &subscriptions)
    }
}
