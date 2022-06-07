//
//  SearchViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 06/06/2022.
//

import Foundation
import Combine

enum SearchResultState {
    case hasResult([Product])
    case noResult([Product])
}

protocol SearchViewModelProtocol: AnyObject {
    var searchKeyWordPublisher:PassthroughSubject <String, Never> { set get }
    var searchResultStatePublisher: CurrentValueSubject<SearchResultState, Never> { get }
    var sectionName: String { get }
}

class SearchViewModel: SearchViewModelProtocol {
    
    private var subscriptions = Set<AnyCancellable>()
    private var initialProductsList = [Product]()
    var searchResultStatePublisher: CurrentValueSubject<SearchResultState, Never>
    var searchKeyWordPublisher = PassthroughSubject<String, Never>()
    var sectionName: String = "الاكثر مبيعا"
    
    init() {
        let initialSearchState = SearchResultState.noResult([Product]())
        searchResultStatePublisher = CurrentValueSubject<SearchResultState, Never>(initialSearchState)
        NetworkManager.shared().getProducts().sink { completion in
            
        } receiveValue: {  [weak self] productsResponse in
            guard let self = self else { return }
            guard productsResponse.success else { return }
            guard !productsResponse.products.data.isEmpty else { return }
            let productsList = productsResponse.products.data
            self.initialProductsList = productsList
            let searchState = SearchResultState.noResult(self.initialProductsList)
            
            self.searchResultStatePublisher.send(searchState)
        }.store(in: &subscriptions)

        bindToSearchKeyWordStream()
    }
    
    private func fetchProducts(with searchKeyWord: String? = nil) {
        NetworkManager.shared().getProducts(productName: searchKeyWord).sink { completion in
            print(completion)
        } receiveValue: { [weak self] productsResponse in
            guard let self = self else { return }
            guard productsResponse.success else { return }
            guard !productsResponse.products.data.isEmpty else {
                let searchState = SearchResultState.noResult(self.initialProductsList)
                self.searchResultStatePublisher.send(searchState)
                return
            }
            let productsList = productsResponse.products.data
            let count = String(productsList.count)
            self.sectionName = "\(count) \(L10n.searchResultCount)"
            let searchState = SearchResultState.hasResult(productsList)
            self.searchResultStatePublisher.send(searchState)
            print(searchState)
        }.store(in: &subscriptions)
    }
    
    func bindToSearchKeyWordStream() {
        searchKeyWordPublisher.sink { [weak self] searchKeyword in
            guard let self = self else { return }
            if !searchKeyword.isEmpty {
                self.fetchProducts(with: searchKeyword)
            } else {
                self.sectionName = L10n.mostSelledProducts
                let searchState = SearchResultState.noResult(self.initialProductsList)
                self.searchResultStatePublisher.send(searchState)
            }
        }.store(in: &subscriptions)
    }
}
