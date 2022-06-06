//
//  CartItem.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 05/06/2022.
//

import Foundation

struct CartItem: Decodable {
    let quantity: Int
    let price: String
    let product: Product    
}


