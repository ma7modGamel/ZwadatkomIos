//
//  RegisterView.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit

class RegisterView: UIView {
    
    private var scrollView = UIScrollView(frame: .zero)
    private var contentView = UIView()
    
    private let headLabel = UILabel(frame: .zero)
    private var containerStack = UIStackView(frame: .zero)
    
    let fullNameTextField = TextFieldWithIcon(icon: "envelope")
    let usernameTextField = TextFieldWithIcon(icon: "envelope")
    let passwordTextField = TextFieldWithIcon(icon: "envelope")
    let forgetPasswordButton = UIButton()
    let loginButton = ZawadButton()
    let socialHeadLabel = UILabel()
    let socialStack = UIStackView()
    let registerContainerView = UIView()
    let registerButton = UIButton()
    
    
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
        configureScrollView()
        configureHeadLabel()
        configureContainerStack()
        configureForgetPasswordButton()
        configureLoginButton()
        configureSocialLaHeadLabel()
        configureSocialStack()
        configureRegisterButton()
        
        // layout views
        layoutScrollView()
        layoutHeadLabel()
        layoutContainerView()
        layoutContentView()
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
        print("layout view sub views")
    }
    
    private func configureScrollView() {
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func configureHeadLabel() {
        headLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.bold, size: 24)
        let headText = "\(L10n.registerHeadText)"
        headLabel.text = headText
    }
    
    private func configureContainerStack() {
        let fullNameHead = textHeadLabel(L10n.fullNameHeadText)
        let usernameHead = textHeadLabel(L10n.usernameHeadText)
        let passwordHead = textHeadLabel(L10n.passwordHeadText)
        let stackViews = [fullNameHead, fullNameTextField, usernameHead, usernameTextField, passwordHead, passwordTextField]
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

extension RegisterView {
    
    private func layoutScrollView() {
        addSubview(scrollView)
        scrollView.anchor(top: safeAreaLayoutGuide.topAnchor,
                          left: leftAnchor,
                          bottom: safeAreaLayoutGuide.bottomAnchor,
                          right: rightAnchor)
    }
    
    private func layoutContentView() {
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.contentLayoutGuide.topAnchor,
                           left: scrollView.contentLayoutGuide.leftAnchor,
                           bottom: scrollView.contentLayoutGuide.bottomAnchor,
                           right: scrollView.contentLayoutGuide.rightAnchor)
        //contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
    
    private func layoutHeadLabel() {
        contentView.addSubview(headLabel)
        headLabel.anchor(top: contentView.topAnchor,
                         left: contentView.leftAnchor,
                         right: contentView.rightAnchor,
                         topConstant: 60,
                         leftConstant: 60,
                         rightConstant: 60)
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
        //        registerContainerView.translatesAutoresizingMaskIntoConstraints = false
        //        NSLayoutConstraint.activate([
        //            registerContainerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        //            //registerContainerView.topAnchor.constraint(greaterThanOrEqualTo: socialStack.bottomAnchor, constant: 100),
        //            registerContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        //
        //       ])
        registerContainerView.anchor(bottom: contentView.bottomAnchor,
                                     bottomConstant: 30)
        registerContainerView.anchorCenterXToSuperview()
        registerContainerView.topAnchor.constraint(greaterThanOrEqualTo: socialStack.bottomAnchor, constant: 120).isActive = true
        
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
