//
//  DeepLinkOption.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import Foundation

struct DeepLinkURLConstants {
    static let Splash = "splash"
    static let Settings = "settings"
    static let Login = "login"
    static let Register = "signUp"
}

enum DeepLinkOption {
    case splash
    case settings
    case login
    case register
    
    static func build(with id: String, params: [String : AnyObject]?) -> DeepLinkOption? {
        //let itemID = params?["item_id"] as? String
        switch id {
        case DeepLinkURLConstants.Splash: return .splash
        case DeepLinkURLConstants.Settings: return .settings
        case DeepLinkURLConstants.Login: return .login
        case DeepLinkURLConstants.Register: return .register
        default: return nil
        }
    }
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        guard let id = dict?["launch_id"] as? String else { return nil }
        
        //let itemID = dict?["item_id"] as? String
        
        switch id {
        case DeepLinkURLConstants.Splash: return .splash
        case DeepLinkURLConstants.Login: return .login
        case DeepLinkURLConstants.Register: return .register
        case DeepLinkURLConstants.Settings: return .settings
        default: return nil
        }
    }
    
}
