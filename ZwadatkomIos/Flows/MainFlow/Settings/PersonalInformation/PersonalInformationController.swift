//
//  PersonalInformationController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit
import Combine

protocol PersonalInformationControllerProtocol: BaseController {
}

class PersonalInformationController: BaseUIViewController, PersonalInformationControllerProtocol {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator helpers ...
    //----------------------------------------------------------------------------------------------------------------
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var viewModel: PersonalInformationViewModel!
    private weak var personalInformationView: PersonalInformationView! {
        willSet {
            self.view = newValue
            self.baseView = newValue
        }
    }
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: PersonalInformationViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let personalInformationView = PersonalInformationView()
        self.personalInformationView = personalInformationView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
        print("with did load \(String(describing: self)) with count of subscriptions \(subscriptions.count) ")
    }
}
extension PersonalInformationController {
    private func bindToDataStreamsAndUserInteractions() {
        bindToUserInformation()
        bindToSaveButtonUserTap()
    }
    private func bindToUserInformation() {
        viewModel.currentUserInformationPublisher.assign(to: \.currentUser, on: personalInformationView).store(in: &subscriptions)
    }
    private func bindToSaveButtonUserTap() {
        personalInformationView.saveButton.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            print(self)
        }.store(in: &subscriptions)
    }
}
