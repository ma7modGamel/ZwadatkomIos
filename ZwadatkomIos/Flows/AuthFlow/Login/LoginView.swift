//
//  LoginView.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 17/05/2022.
//

import UIKit
import SwiftUI

class LoginView: BaseUIView {
    
    private let headLabel = UILabel(frame: .zero)
    private var containerStack = UIStackView(frame: .zero)
    
    let usernameTextField = TextFieldWithIcon(icon: "envelope")
    let passwordTextField = TextFieldWithIcon(icon: "lock.open")
    let forgetPasswordButton = UIButton()
    let loginButton = ZawadButton()
    let socialHeadLabel = UILabel()
    let socialStack = UIStackView()
    let registerContainerView = UIView()
    let registerButton = UIButton()
    let authSkipButton = UIButton()
    
    
    private var textHeadLabel: ((_ text: String) -> (UILabel)) = { text in
        let label = UILabel(text: text)
        let font = UIFont(font: FontFamily.TheSansArabic.light, size: 14)
        label.textColor = ColorName.semiGray.color
        label.textAlignment = .natural
        label.font = font
        return label
    }
    
    private var socialImageView : ((_ imageAsset: ImageAsset) -> (UIImageView)) = { imageAsset in
        let imageView = UIImageView(frame: .zero)
        let image = UIImage(asset: imageAsset)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 52).isActive = true
        return imageView
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color
        configureHeadLabel()
        configureContainerStack()
        configureSkipButton()
        configureForgetPasswordButton()
        configureLoginButton()
        configureSocialLaHeadLabel()
        configureSocialStack()
        configureRegisterButton()
        
        // layout views
        layoutSkipButton()
        layoutHeadLabel()
        layoutContainerView()
        layoutForgetPasswordButton()
        layoutLoginButton()
        layoutSocialHeadLabel()
        layoutSocialStackView()
        layoutRegisterContainerView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func configureSkipButton() {
        authSkipButton.setTitleForAllStates(L10n.skipAuthButtonTitle)
        authSkipButton.setTitleColorForAllStates(ColorName.blackColor.color)
        authSkipButton.titleLabel?.font = UIFont(font: FontFamily.TheSansArabic.light, size: 12)
        backButton.isHidden = true
    }
    
    private func configureHeadLabel() {
        headLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.bold, size: 24)
        let headText = "\(L10n.signInHeadText) \n\(L10n.signInAppName)"
        headLabel.numberOfLines = 2
        headLabel.text = headText
    }
    
    private func configureContainerStack() {
        let usernameHead = textHeadLabel(L10n.usernameHeadText)
        let passwordHead = textHeadLabel(L10n.passwordHeadText)
        let stackViews = [usernameHead, usernameTextField, passwordHead, passwordTextField]
        containerStack.addArrangedSubviews(stackViews)
        containerStack.axis = .vertical
        containerStack.distribution = .fill
        containerStack.spacing = 12
    }

    private func configureForgetPasswordButton() {
        forgetPasswordButton.setTitleForAllStates(L10n.forgetPasswordButtonTitle)
        forgetPasswordButton.titleLabel?.font = UIFont(font: FontFamily.TheSansArabic.light, size: 14)
        forgetPasswordButton.setTitleColorForAllStates(ColorName.semiGray.color)
    }

    private func configureLoginButton() {
        loginButton.setTitleForAllStates(L10n.loginButtonTitle)
        loginButton.setTitleColorForAllStates(ColorName.whiteColor.color)
    }
    
    private func configureSocialLaHeadLabel() {
        socialHeadLabel.text = L10n.socialHeadTitle
        socialHeadLabel.textColor = ColorName.semiGray.color
        socialHeadLabel.textAlignment = .center
        socialHeadLabel.font = UIFont(font: FontFamily.TheSansArabic.light, size: 14)
    }
    
    private func configureSocialStack() {
        let appleView = socialImageView(Asset.apple)
        let googleView = socialImageView(Asset.google)
        let facebookView = socialImageView(Asset.facebook)
        let twitterView = socialImageView(Asset.twitter)
        let stackViews = [appleView, googleView, facebookView, twitterView]
        socialStack.addArrangedSubviews(stackViews)
        socialStack.distribution = .fill
        socialStack.axis = .horizontal
        socialStack.spacing = 12
    }
    
    private func configureRegisterButton() {
        registerButton.setTitleForAllStates(L10n.registerButton)
        registerButton.setTitleColorForAllStates(ColorName.darkGreen.color)
        registerButton.titleLabel?.font = UIFont(font: FontFamily.TheSansArabic.light, size: 14)
    }
}

extension LoginView {
    
    private func layoutSkipButton() {
        headerView.addSubview(authSkipButton)
        authSkipButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authSkipButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -Measurements.leadingPadding),
            authSkipButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
    }

    private func layoutHeadLabel() {
        contentView.addSubview(headLabel)
        headLabel.anchor(top: contentView.topAnchor,
                         left: contentView.leftAnchor,
                         right: contentView.rightAnchor,
                         topConstant: 25,
                         leftConstant: 55,
                         rightConstant: 55)
    }

    private func layoutContainerView() {
        contentView.addSubview(containerStack)
        containerStack.anchor(top: headLabel.bottomAnchor,
                              left: headLabel.leftAnchor,
                              right: headLabel.rightAnchor,
                              topConstant: 60)
    }
    
    private func layoutForgetPasswordButton() {
        contentView.addSubview(forgetPasswordButton)
        forgetPasswordButton.anchor(top: containerStack.bottomAnchor,
                                    left: headLabel.leftAnchor,
                                    topConstant: 10)
    }
    
    private func layoutLoginButton() {
        contentView.addSubview(loginButton)
        loginButton.anchor(top: forgetPasswordButton.bottomAnchor,
                           left: headLabel.leftAnchor,
                           right: headLabel.rightAnchor,
                           topConstant: 20)
    }
    
    private func layoutSocialHeadLabel() {
        contentView.addSubview(socialHeadLabel)
        socialHeadLabel.anchor(top: loginButton.bottomAnchor,
                               left: headLabel.leftAnchor,
                               right: headLabel.rightAnchor,
                               topConstant: 20)
    }
    
    private func layoutSocialStackView() {
        contentView.addSubview(socialStack)
        socialStack.anchor(top: socialHeadLabel.bottomAnchor,
                           topConstant: 25)
        socialStack.anchorCenterXToSuperview()
    }
    
    private func layoutRegisterContainerView() {
        contentView.addSubview(registerContainerView)
        registerContainerView.anchor(bottom: contentView.bottomAnchor,
                                     bottomConstant: 30)
        registerContainerView.anchorCenterXToSuperview()
        registerContainerView.topAnchor.constraint(greaterThanOrEqualTo: socialStack.bottomAnchor, constant: 110).isActive = true
        
        let label = textHeadLabel(L10n.registerLabel)
        registerContainerView.addSubview(label)
        registerContainerView.addSubview(registerButton)
        label.anchor(top: registerContainerView.topAnchor,
                     bottom: registerContainerView.bottomAnchor,
                     right: registerContainerView.rightAnchor)
        registerButton.anchor(top: registerContainerView.topAnchor,
                              left:registerContainerView.leftAnchor,
                              bottom: registerContainerView.bottomAnchor,
                              right: label.leftAnchor)
    }
}
