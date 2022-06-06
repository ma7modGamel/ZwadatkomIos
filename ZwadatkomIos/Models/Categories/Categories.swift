//
//  Categories.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 30/05/2022.
//

import Foundation

struct Categories: Codable {
    let currentPage: Int
    let data: [Category]
    let firstPageURL: String
    let from, lastPage: Int
    let lastPageURL: String
    let nextPageURL: JSONNull?
    let path: String
    let perPage: Int
    let prevPageURL: JSONNull?
    let to, total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case firstPageURL = "first_page_url"
        case from
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to, total
    }
}
