//
//  HomeViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: AnyObject {
    var bannersListPublisher: CurrentValueSubject<[String], Never> { get }
    var categoriesListPublisher: CurrentValueSubject<[String], Never> { get }
    var productsListPublisher: CurrentValueSubject<[String], Never> { get }
}

class HomeViewModel: HomeViewModelProtocol {
    
    var productsListPublisher = CurrentValueSubject<[String], Never>([String]())
    var bannersListPublisher = CurrentValueSubject<[String], Never>([String]())
    var categoriesListPublisher = CurrentValueSubject<[String], Never>([String]())
    var isLoadingPublisher = CurrentValueSubject<Bool, Never>(true)

    init() {
        self.fetchData()
    }
    
    private func fetchData() {
        self.isLoadingPublisher.send(true)
        print("Start fetching Data")
    }
}

struct Banar: Codable {
    let image: String
}
