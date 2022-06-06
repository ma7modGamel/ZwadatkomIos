//
//  Address.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import Foundation

struct Address: Codable {
    let id: Int
    let latitude, longitude, country, city: String
    let address, moreAddress, addressType: String
    let userID: Int
    let deletedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, latitude, longitude, country, city, address, moreAddress, addressType
        case userID = "user_id"
        case deletedAt = "deleted_at"
    }
}
