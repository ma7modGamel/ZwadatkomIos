//
//  User.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let avatar: JSONNull?
    let email, mobile: String
    let emailVerifiedAt: JSONNull?
    let mobileVerifiedAt: String
    let online: Int
    let latitude, longitude: String
    let deletedAt: JSONNull?
    let verified: Int
    let verificationToken: JSONNull?
    let deviceKey: String
    let wallet: Int
    let googleID, appleID, facebookID: JSONNull?
    let userRole: String
    let address: [Address]
    let orderCount: Int
    let shop: Shop
    let addresses: [Address]

    enum CodingKeys: String, CodingKey {
        case id, name, avatar, email, mobile
        case emailVerifiedAt = "email_verified_at"
        case mobileVerifiedAt = "mobile_verified_at"
        case online, latitude, longitude
        case deletedAt = "deleted_at"
        case verified
        case verificationToken = "verification_token"
        case deviceKey = "device_key"
        case wallet
        case googleID = "google_id"
        case appleID = "apple_id"
        case facebookID = "facebook_id"
        case userRole, address, orderCount, shop, addresses
    }
}
