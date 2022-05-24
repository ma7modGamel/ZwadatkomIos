//
//  AuthResponse.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import Foundation

struct AuthResponse: Codable {
    let success: Bool
    let token: String?
    let user: User?
}




// MARK: - Shop
struct Shop: Codable {
    let id: Int
    let openAt, closeAt, shopDescription: JSONNull?
    let addressID, userID: Int
    let deletedAt: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, openAt, closeAt, shopDescription
        case addressID = "address_id"
        case userID = "user_id"
        case deletedAt = "deleted_at"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
