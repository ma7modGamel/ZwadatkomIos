//
//  SettingViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import Foundation
import Combine

protocol SettingsViewModelProtocol: AnyObject {
    var userPublisher: CurrentValueSubject<User?, Never> { get }
}
class SettingsViewModel: SettingsViewModelProtocol {
    
    internal var userPublisher: CurrentValueSubject<User?, Never>
    
    init() {
        let user =  RealmManager.shared.object(User.self, key: User.uniqueKey)
        self.userPublisher = CurrentValueSubject<User?, Never>(user)
    }
}
