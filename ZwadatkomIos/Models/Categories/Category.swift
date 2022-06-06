//
//  Category.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 30/05/2022.
//

import Foundation

struct Category: Codable, Hashable {
    let id: Int
    let name: String
    let color: String
    let image: String

    var isSelected: Bool = true

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case color, image
    }
}
