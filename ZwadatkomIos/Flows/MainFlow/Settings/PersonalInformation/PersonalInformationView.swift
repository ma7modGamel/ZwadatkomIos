//
//  PersonalInformationView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit

class PersonalInformationView: BaseUIView {
    
    private var innerSpacing = CGFloat(30)
    private var insetX = CGFloat(55)
    private var contentTopPadding = CGFloat(50)
    
    private let contentStack = UIStackView(frame: .zero)
    private let fullNameTextField = OutLinedTextView(title: L10n.fullNameTextFieldHead)
    private let emailTextField = OutLinedTextView(title: L10n.emailTextFieldHead)
    private let mobileTextField  = OutLinedTextView(title: L10n.categorySectionTitle)
    let saveButton = ZawadButton()
    
    init() {
        super.init(frame: .zero)
        configureStackView()
        configureSaveButton() 
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        let stackViews = [fullNameTextField, emailTextField, mobileTextField, saveButton]
        contentStack.addArrangedSubviews(stackViews)
        contentStack.spacing = innerSpacing
        contentStack.axis = .vertical
        contentStack.distribution = .fill
    }
    
    private func configureSaveButton() {
        saveButton.setTitleForAllStates("")
    }
    
    private func layout() {
        contentView.addSubview(contentStack)
        contentStack.anchor(top: contentView.topAnchor,
                            bottom: contentView.bottomAnchor,
                            topConstant: contentTopPadding)
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: insetX),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -insetX)
        ])
    }
    
}
