//
//  User.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 24/05/2022.
//

import Foundation
import Realm
import RealmSwift

class User: Object, Codable {

    
    
    @Persisted (primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var avatar: String?
    @Persisted var email : String
    @Persisted var mobile: String
//    let emailVerifiedAt: JSONNull?
//    let mobileVerifiedAt: String
//    let online: Int
//    let latitude, longitude: String
//    let deletedAt: JSONNull?
//    let verified: Int
//    let verificationToken: JSONNull?
//    let wallet: Int
//    let googleID, appleID, facebookID: JSONNull?
//    let address: [Address]
//    let orderCount: Int
//    let addresses: [Address]

    enum CodingKeys: String, CodingKey {
        case id, name, avatar, email, mobile
//        case emailVerifiedAt = "email_verified_at"
//        case mobileVerifiedAt = "mobile_verified_at"
//        case online, latitude, longitude
//        case deletedAt = "deleted_at"
//        case verified
//        case verificationToken = "verification_token"
//        case wallet
//        case googleID = "google_id"
//        case appleID = "apple_id"
//        case facebookID = "facebook_id"
//        case address, orderCount, addresses
    }
}
