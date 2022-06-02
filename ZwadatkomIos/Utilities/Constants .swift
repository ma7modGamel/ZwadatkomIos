//
//  Constants .swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import Foundation
import UIKit.UIGeometry

// UserDefaultsKeys
struct UserDefaultsKeys {
    static let token = "UDKToken"
    static let onboardingState = "UDOnboardingState"
    static let authState = "UDKAuthState"

}

struct URLs {
    static let baseURL = "https://test.dnbscy.com/api/encryptRoute"
    static let login = "/signin"
    static let register = "/signup"
    static let userInformations = "/v1/profile"
    static let banners = "/v1/promotionView"
    static let categories = "v1/categories"
    static let products = "/v1/products"
}

struct Cells {
    static let bannerCell = "BannerCell"
    static let categoryCell = "CategoryCell"
    static let largeCategoryCell = "LargeCategoryCell"
    static let productCell = "ProductCell"
}

struct SectionsHeaders {
    static let categoryHeader = "CategorySectionHeader"
    static let sectionHeader = "SectionHeader"
}

struct SupplementaryViews {
    static let categoryHeader = "CategorySupplementaryView"
    static let sectionHeader = "SectionHeader"
}

struct HeaderKeys {
    static let contentType = "Content-Type"
    static let accept = "accept"
}

struct Measurements {
    static let leadingPadding: CGFloat = 55
}

