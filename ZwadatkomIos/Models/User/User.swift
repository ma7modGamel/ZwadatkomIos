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

    static let uniqueKey: String = "CurentUser"
    @Persisted(primaryKey: true) var uniqueKey: String = User.uniqueKey

    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var avatar: String?
    @Persisted var email : String
    @Persisted var mobile: String

    enum CodingKeys: String, CodingKey {
        case id, name, avatar, email, mobile
    }
}
