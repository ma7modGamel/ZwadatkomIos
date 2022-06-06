//
//  OrdersMainResponse.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import Foundation

// MARK: - Welcome
struct OrdersMainResponse: Decodable {
    let success: Bool
    let orders: Orders
}

// MARK: - Orders
struct Orders: Decodable {
    let currentPage: Int
    let data: [Order]
    let perPage: Int
    let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
        case perPage = "per_page"
        case total
    }
}

// MARK: - Payment
struct Payment: Codable {
    let id: Int
    let method, total, shippingFee: String
    let orderID: Int
    let statusID: JSONNull?
    let wallet: Int
    let walletDiscount: String
    let promotion: JSONNull?
    let taxID: Int
    let taxes: Taxes
    let tax: String

    enum CodingKeys: String, CodingKey {
        case id, method, total, shippingFee
        case orderID = "order_id"
        case statusID = "status_id"
        case wallet
        case walletDiscount = "wallet_discount"
        case promotion
        case taxID = "tax_id"
        case taxes, tax
    }
}

// MARK: - Taxes
struct Taxes: Codable {
    let id: Int
    let type, value: String
    let deletedAt, createdAt, updatedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, type, value
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Status
struct Status: Codable {
    let id: Int
    let name, type: String
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let label: String
    let active: Bool
}
