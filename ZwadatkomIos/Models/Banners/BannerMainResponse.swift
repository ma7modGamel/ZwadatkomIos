//
//  BannerMainResponse.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 30/05/2022.
//

import Foundation

struct BannerMainResponse: Codable {
    let success: Bool
    let offers: [Banner]
}
