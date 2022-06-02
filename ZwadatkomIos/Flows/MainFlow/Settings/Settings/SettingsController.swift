//
//  SettingsController.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit
import Combine

protocol SettingsControllerProtocol: BaseController {
    var onPersonalTapPublisher: PassthroughSubject<Void, Never> { get }
}

final class SettingsController: BaseUIViewController, SettingsControllerProtocol {
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Coordinator handlers ...
    //----------------------------------------------------------------------------------------------------------------
    internal var onPersonalTapPublisher = PassthroughSubject<Void, Never>()
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Properties ...
    //----------------------------------------------------------------------------------------------------------------
    private var viewModel: SettingsViewModelProtocol!
    private var settingsView: SettingsView!
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Life cycle methods ...
    //----------------------------------------------------------------------------------------------------------------
    init(viewModel: SettingsViewModelProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let settingsView = SettingsView()
        self.settingsView = settingsView
        self.baseView = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToDataStreamsAndUserInteractions()
    }
}
extension SettingsController {
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Private methods ...
    //----------------------------------------------------------------------------------------------------------------
    private func bindToDataStreamsAndUserInteractions() {
        bindToUserDataStream()
        bindToPersonalInformationsTab()
    }
    private func bindToUserDataStream() {
        viewModel.userPublisher.sink { [weak self] user in
            guard let self = self else { return }
            self.settingsView.configure(with: user)
        }.store(in: &subscriptions)
    }
    private func bindToPersonalInformationsTab() {
        settingsView.personalInformationGesture.tapPublisher.sink { [weak self] _ in
            guard let self = self else { return }
            self.onPersonalTapPublisher.send()
        }.store(in: &subscriptions)
    }
}
