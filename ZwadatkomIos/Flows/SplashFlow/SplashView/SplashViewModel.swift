//
//  SplashViewModel.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 26/05/2022.
//

import Foundation
import Combine

protocol SplashViewModelProtocol: AnyObject {
    var onFinishSetDataPublisher: PassthroughSubject<Void, Never> { get }
}

final class SplashViewModel: SplashViewModelProtocol {
    
    internal var onFinishSetDataPublisher = PassthroughSubject<Void, Never>()

    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.checkForValidToken()
    }
    
    private func checkForValidToken() {
        if (UserDefaultsManager.shared().token != nil) {
            fetchUserSavedData()
        } else {
            deleteUserOldSavedData()
        }
    }
    
    private func fetchUserSavedData() {
        NetworkManager.shared().getUserInformations().sink { _ in
        } receiveValue: { [weak self] response in
            guard let self = self else { return }
            switch response.success {
            case true:
                self.updateUserData(with: response.user)
            case false:
                self.deleteUserOldSavedData()
            }
        }.store(in: &subscriptions)
    }
    
    private func updateUserData(with user: User) {
        RealmManager.shared.add(user)
        onFinishSetDataPublisher.send(completion: .finished)
    }
    
    private func deleteUserOldSavedData() {
        onFinishSetDataPublisher.send(completion: .finished)
    }
}
