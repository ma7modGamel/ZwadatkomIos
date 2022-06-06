//
//  Cart.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 05/06/2022.
//

import Foundation

struct Cart: Decodable{
    let id, userID, total: Int
    var cartItems: [CartItem]?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case total
        case items
    }
    enum CartItemsKeys: String, CodingKey {
        case qty
        case price
        case productOption = "product_option"
    }
    enum ProductOptionKeys: String, CodingKey {
        case productDetails = "product_details"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        userID = try container.decode(Int.self, forKey: .userID)
        total = try container.decode(Int.self, forKey: .total)
        
        guard var itemsContainer = try? container.nestedUnkeyedContainer(forKey: .items) else { return }
        cartItems = [CartItem]()
        while !itemsContainer.isAtEnd {
            let productContainer =  try itemsContainer.nestedContainer(keyedBy: CartItemsKeys.self)
            let price = try productContainer.decode(String.self, forKey: .price)
            let quantity = try productContainer.decode(Int.self, forKey: .qty)
            guard let productOptionContainer = try? productContainer.nestedContainer(keyedBy: ProductOptionKeys.self , forKey: .productOption) else { return }
            let product = try productOptionContainer.decode(Product.self, forKey: .productDetails)
            let cartItem = CartItem(quantity: quantity, price: price, product: product)
            cartItems?.append(cartItem)
        }
    }
}


