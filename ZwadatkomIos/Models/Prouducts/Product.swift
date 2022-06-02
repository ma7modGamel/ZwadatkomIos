//
//  Product.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 30/05/2022.
//

import Foundation

struct Product: Codable, Hashable {
    
    
    private let identifier = UUID()
    
    let id: Int
    let name: String
    let productDescription: String
    let price: String
    let images: [Image]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case productDescription = "description"
        case price
        case images
    }
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }

    static func == (lhs: Product, rhs: Product) -> Bool {
      return lhs.identifier == rhs.identifier
    }
    

}

struct Image: Codable {
    let id: Int
    let image: String
    let productID: Int

    enum CodingKeys: String, CodingKey {
        case id, image
        case productID = "product_id"
    }
}
