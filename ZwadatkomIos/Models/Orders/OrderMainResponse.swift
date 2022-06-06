//
//  OrderMainResponse.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 05/06/2022.
//

import Foundation

struct OrderMainResponse: Decodable {
    let success: Bool
    let order: Order
}

