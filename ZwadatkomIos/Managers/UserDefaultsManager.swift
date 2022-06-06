//
//  UserDefaultsManager.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 16/05/2022.
//

import Foundation
import Combine

class UserDefaultsManager {
    
    // MARK:- Singleton
    private static let sharedInstance = UserDefaultsManager()
    //var userAuthStatePublisher: CurrentValueSubject<Bool, Never>
    
    class func shared() -> UserDefaultsManager {
        return UserDefaultsManager.sharedInstance
    }
    
    private init() {
       // userAuthStatePublisher = CurrentValueSubject<Bool, Never>(false)
       // let userAuthState = getUserAuthState()
        //userAuthStatePublisher.send(userAuthState)
    }
    
    // MARK:- Properties
    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.token)
        }
        get {
            guard let token = UserDefaults.standard.string(forKey: UserDefaultsKeys.token) else { return nil }
            return token
        }
    }
    
    var isBoardingShowed: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.onboardingState)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.onboardingState) != nil else {
                return false
            }
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.onboardingState)
        }
    }
    
    var isAuthFinished: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.authState)
        }
        get {
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.authState) != nil else {
                return false
            }
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.authState)
        }
    }
}
