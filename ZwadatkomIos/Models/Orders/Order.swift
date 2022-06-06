//
//  Order.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import Foundation

struct Order: Decodable, Hashable {
    let id, addressID, cartID, userID: Int
    let statusID: Int
    let created: String
    let status: Status
    let cart: Cart
    let address: Address
    //let payment: Payment?

    enum CodingKeys: String, CodingKey {
        case id
        case addressID = "address_id"
        case cartID = "cart_id"
        case userID = "user_id"
        case statusID = "status_id"
        case created, status, cart, address
        //, payment
    }
    
    private let identifier = UUID()
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }

    static func == (lhs: Order, rhs: Order) -> Bool {
      return lhs.identifier == rhs.identifier
    }
}
