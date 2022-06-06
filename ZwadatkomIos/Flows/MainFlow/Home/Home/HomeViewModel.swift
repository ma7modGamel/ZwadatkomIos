//
//  HomeViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation
import Combine
import StoreKit

protocol HomeViewModelProtocol: AnyObject {
    var bannersListPublisher: CurrentValueSubject<[Banner], Never> { get }
    var categoriesListPublisher: CurrentValueSubject<[Category], Never> { get }
    var productsListPublisher: CurrentValueSubject<[Product], Never> { get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    private var subscriptions = Set<AnyCancellable>()
    
    var productsListPublisher = CurrentValueSubject<[Product], Never>([Product]())
    var bannersListPublisher = CurrentValueSubject<[Banner], Never>([Banner]())
    var categoriesListPublisher = CurrentValueSubject<[Category], Never>([Category]())
    var isLoadingPublisher = CurrentValueSubject<Bool, Never>(true)

    init() {
        self.fetchData()
        fetchCategories()
        fetchProducts()
    }
    
    private func fetchData() {
        self.isLoadingPublisher.send(true)
        NetworkManager.shared().getBanners().sink { completion in
            
        } receiveValue: { [weak self] bannersResponse in
            guard let self = self else { return }
            guard bannersResponse.success else { return }
            self.bannersListPublisher.send(bannersResponse.offers)
        }.store(in: &subscriptions)
    }
    
    private func fetchCategories() {
        NetworkManager.shared().getCategories().sink { completion in
            print(completion)
        } receiveValue: { [weak self] categoriesResponse in
            guard let self = self else { return }
            guard categoriesResponse.success else { return }
            var categoriesList = self.categoriesListPublisher.value
            categoriesList.append(contentsOf: categoriesResponse.categories.data)
            self.categoriesListPublisher.send(categoriesList)
        }.store(in: &subscriptions)
    }
    
    private func fetchProducts() {
        NetworkManager.shared().getProducts().sink { completion in
            print(completion)
        } receiveValue: { [weak self] productsResponse in
            guard let self = self else { return }
            guard productsResponse.success else { return }
            var productsList = self.productsListPublisher.value
            productsList.append(contentsOf: productsResponse.products.data)
            self.productsListPublisher.send(productsList)
        }.store(in: &subscriptions)
    }
}

struct Banner: Codable, Hashable {
    let image: String?
}

