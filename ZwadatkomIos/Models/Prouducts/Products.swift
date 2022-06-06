//
//  Products.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 30/05/2022.
//

import Foundation

struct Products: Codable {
    let data: [Product]
    let currentPage: Int
    let perPage: Int
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case perPage = "per_page"
        case total
    }
}
