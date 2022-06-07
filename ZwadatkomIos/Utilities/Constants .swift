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
    static let orders = "/v1/order/show"
    static let order = "/v1/order/details/"
}

struct Cells {
    static let bannerCell = "BannerCell"
    static let categoryCell = "CategoryCell"
    static let largeCategoryCell = "LargeCategoryCell"
    static let productCell = "ProductCell"
    static let orderCell = "OrderCell"
}

struct SectionsHeaders {
    static let categoryHeader = "CategorySectionHeader"
    static let noResultHeader = "NoResultHeader"
    static let sectionHeader = "SectionHeader"
}

struct SupplementaryViewTypes {
    static let categoryHeader = "CategorySupplementaryView"
    static let sectionHeader = "SectionHeader"
    static let noResultHeaderView = "NoResultHeaderView"
}

struct HeaderKeys {
    static let contentType = "Content-Type"
    static let accept = "accept"
}

struct Measurements {
    static let leadingPadding: CGFloat = 55
}

enum supplementaryViewTypes: String {
    case categoryHeader
    case sectionHeader
    case noResultHeaderView
}
