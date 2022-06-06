//
//  PersonalInformationViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import Foundation
import RealmSwift
import Combine

protocol PersonalInformationViewModelProtocol: AnyObject {
    
}

class PersonalInformationViewModel: PersonalInformationViewModelProtocol {
    
    var currentUserInformationPublisher: CurrentValueSubject<User?, Never>
    var objectNotificationToken: NotificationToken?
    
    var updatedValues: User?
    
    
    init() {
        let currentUser = RealmManager.shared.object(User.self, key: User.uniqueKey)
        self.currentUserInformationPublisher = CurrentValueSubject<User?, Never>(currentUser)
//        objectNotificationToken = RealmManager.shared.getRealm().object(ofType: User.self, forPrimaryKey: User.uniqueKey)?.observe({ change in
//            print(change)
//        })
    }
    
    func updateUserInformation() {
        
    }
}

