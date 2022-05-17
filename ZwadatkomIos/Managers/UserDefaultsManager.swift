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
    
    init() {
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
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.token) != nil else {
                return nil
            }
            return "Bearer \(UserDefaults.standard.string(forKey: UserDefaultsKeys.token)!)"
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
}
