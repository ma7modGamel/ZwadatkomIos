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

}

struct URLs {
    static let baseURL = "https://test.dnbscy.com/api/encryptRoute"
    static let login = "/signin"
    static let register = "/signup"
}

struct Cells {
    static let categoryCell = "CategoryCell"
    static let categoryServiceCell = "CategoryServiceCell"
    static let galleryCell = "GalleryCell"
    static let cartItemCell = "CartItemCell"
}

struct HeaderKeys {
    static let contentType = "Content-Type"
    static let accept = "accept"
}

struct Measurements {
    static let leadingPadding: CGFloat = 55
}
