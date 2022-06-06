//
//  PersonalInformationView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit
import Combine

class PersonalInformationView: BaseUIView {
    
    @Published var currentUser: User?
    private var subscription: AnyCancellable?
    
    private var innerSpacing = CGFloat(30)
    private var insetX = CGFloat(55)
    private var contentTopPadding = CGFloat(50)
    private var avatarImageConstant = CGFloat(150)
    
    private let contentStack = UIStackView(frame: .zero)
    private let avatarImageView = UIImageView(frame: .zero)
    private let fullNameTextField = OutLinedTextView(title: L10n.fullNameTextFieldHead)
    private let emailTextField = OutLinedTextView(title: L10n.emailTextFieldHead)
    private let mobileTextField  = OutLinedTextView(title: L10n.mobileTextFieldHead)
    let saveButton = ZawadButton()
    
    init() {
        super.init(frame: .zero)
        configureAvatarImageView()
        configureSaveButton()
        configureStackView()
        layout()
        subscription = $currentUser.sink { [weak self] currentUser  in
            guard let self = self else { return }
            self.fullNameTextField.text = currentUser?.name
            self.emailTextField.text = currentUser?.email
            self.mobileTextField.text = currentUser?.mobile
        }
        self.viewTitleLabel.text = L10n.personalInformationsControllerTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        let stackViews = [avatarImageView ,fullNameTextField, emailTextField, mobileTextField, saveButton]
        contentStack.addArrangedSubviews(stackViews)
        contentStack.spacing = innerSpacing
        contentStack.axis = .vertical
        contentStack.distribution = .fill
    }
    
    private func configureSaveButton() {
        saveButton.setTitleForAllStates(L10n.saveButton)
    }
    private func configureAvatarImageView() {
        avatarImageView.layerCornerRadius = 150 / 2
        avatarImageView.image = UIImage(asset: Asset.userAvatar)
    }
    
    private func layout() {
        layoutAvatarImageView()
        layoutContentStackView()
    }
    
    private func layoutAvatarImageView() {
        addSubview(avatarImageView)
        avatarImageView.anchorCenterXToSuperview()
        avatarImageView.anchor(top: contentView.topAnchor,
                               topConstant: contentTopPadding,
                               widthConstant: avatarImageConstant,
                               heightConstant: avatarImageConstant)
    }
    
    private func layoutContentStackView() {
        contentView.addSubview(contentStack)
        contentStack.anchor(top: avatarImageView.bottomAnchor,
                            bottom: contentView.bottomAnchor,
                            topConstant: contentTopPadding)
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insetX),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -insetX)
        ])
    }
    

}
