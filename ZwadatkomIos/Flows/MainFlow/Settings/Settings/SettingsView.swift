//
//  SettingsView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit

class SettingsView: BaseUIView {
    // sub views
    let backGroundImage = UIImageView(frame: .zero)
    private var basicInformationStack = UIStackView(frame: .zero)
    private var balanceStack = UIStackView(frame: .zero)
    private var buttonsStack = UIStackView(frame: .zero)
    private var avatarImageView = UIImageView(frame: .zero)
    private var userFullNameLabel = UILabel(frame: .zero)
    
    // tap Gestures
    let personalInformationGesture = UITapGestureRecognizer()
    let previousOrdersGesture = UITapGestureRecognizer()
    let settingsGesture = UITapGestureRecognizer()
    let logoutGesture = UITapGestureRecognizer()

    // computed properties
    private var sepLineView: UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = ColorName.softGray.color
        return view
    }
    
    private lazy var basicStack: (ImageAsset, String) -> UIStackView = { image , content in
        let stackView = UIStackView()
        let imageView = UIImageView(image: UIImage(asset: image))
        let contentView = UILabel(text: content)
        contentView.numberOfLines = 2
        imageView.anchor(widthConstant: 46 ,heightConstant: 46)
        stackView.addArrangedSubviews([imageView, contentView])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }
    
    // constants
    private var sidesPadding: CGFloat = 48
    
    init() {
        super.init(frame: .zero)
        configureBackGroundImage()
        configureUserImageView()
        configureBasicInformationStack()
        configureBalanceDetailsStackView()
        configureButtonStackView()
        
        // Layout
        layout()

        self.sendSubviewToBack(backGroundImage)
        self.headerView.backgroundColor = .clear
        self.backgroundColor = ColorName.lightGray.color
    }
    
    internal func configure(with user: User?) {
        guard let user = user else { return }
        configureUserInfoLabel(with: user)
        
    }
    
    private func configureUserInfoLabel(with user: User) {
        userFullNameLabel.textAlignment = .right
        userFullNameLabel.numberOfLines = 0
        let name = user.name
        let id = String(user.id)
        let nameAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.light, size: 14)]
        let idAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.BahijTheSansArabic.light, size: 11)]
        let nameAttributedString = NSMutableAttributedString(string: name, attributes: nameAttributes as [NSAttributedString.Key : Any])
        let idAttributedString = NSMutableAttributedString(string: "\n\(id) :ID", attributes: idAttributes as [NSAttributedString.Key: Any])
        nameAttributedString.append(idAttributedString)
        userFullNameLabel.attributedText = nameAttributedString.colored(with: ColorName.whiteColor.color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBackGroundImage() {
        let image = UIImage(asset: Asset.settingBackground)
        backGroundImage.image = image
    }
    
    
    private func configureBasicInformationStack() {
        let stackViews = [avatarImageView, userFullNameLabel]
        basicInformationStack.addArrangedSubviews(stackViews)
        basicInformationStack.axis = .horizontal
        basicInformationStack.distribution = .fill
        basicInformationStack.spacing = 25
    }

    private func configureUserImageView() {
        let image = UIImage(asset: Asset.userAvatar)
        self.avatarImageView.image = image
    }
    
    private func configureBalanceDetailsStackView() {
        let balanceView = basicStack(Asset.walletImage, "the title os view")
        let ordersCountView = basicStack(Asset.ordersCountImage,  "the title os view")
        
        balanceStack.addArrangedSubviews([balanceView, ordersCountView])
        balanceStack.layoutMargins = UIEdgeInsets(top: 32, left: 12, bottom: 32, right: 12)
        balanceStack.isLayoutMarginsRelativeArrangement = true
        balanceStack.axis = .horizontal
        balanceStack.distribution = .fillEqually
        balanceStack.spacing = 1
        balanceStack.backgroundColor = ColorName.whiteColor.color
        balanceStack.layerCornerRadius = 12

    }
    
    private func configureButtonStackView() {
        let basicInformationImage = UIImage(asset: Asset.userIcon)
        let perviousOrdersImage = UIImage(asset: Asset.settingsIcon)
        let settingsImage = UIImage(asset: Asset.settingsIcon)
        let logoutImage = UIImage(asset: Asset.logoutIcon)
        let basicInformation = createButtonStackView(viewTitle: L10n.personalInformation, viewIcon: basicInformationImage)
        let perviousOrders = createButtonStackView(viewTitle: L10n.orders, viewIcon: perviousOrdersImage)
        let settings = createButtonStackView(viewTitle: L10n.settings, viewIcon: settingsImage)
        let logout = createButtonStackView(viewTitle: L10n.logout, viewIcon: logoutImage, sepLine: false)
        basicInformation.addGestureRecognizer(personalInformationGesture)
        perviousOrders.addGestureRecognizer(previousOrdersGesture)
        settings.addGestureRecognizer(settingsGesture)
        logout.addGestureRecognizer(logoutGesture)

        let buttonsStackViews = [basicInformation, perviousOrders, settings, logout]
        buttonsStack.addArrangedSubviews(buttonsStackViews)
        buttonsStack.axis = .vertical
        buttonsStack.distribution = .fill
        buttonsStack.layoutMargins = UIEdgeInsets(top: 11, left: 25, bottom: 11, right: 25)
        buttonsStack.backgroundColor = ColorName.whiteColor.color
        buttonsStack.isLayoutMarginsRelativeArrangement = true
        buttonsStack.layerCornerRadius = 12
    }
    
    private func createButtonStackView(viewTitle: String, viewIcon: UIImage?, sepLine: Bool = true) -> UIView {
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .light)
        let arrowIcon = UIImage(systemName: "chevron.left", withConfiguration: iconConfig)?.withTintColor(.random, renderingMode: .alwaysOriginal)
        let containerStack = UIStackView(frame: .zero)
        let iconImageView = UIImageView(image: viewIcon)
        let titleLabel = UILabel(text: viewTitle)
        let arrowImageView = UIImageView(image: arrowIcon)

        titleLabel.textAlignment = .right
        titleLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 16)

        let imageIconConstant: CGFloat = 26
        iconImageView.widthAnchor.constraint(equalToConstant: imageIconConstant).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: imageIconConstant).isActive = true

        let bottomLine = sepLineView
        bottomLine.isHidden = !sepLine
        containerStack.addSubview(bottomLine)
        bottomLine.anchor(left: containerStack.leftAnchor, bottom: containerStack.bottomAnchor, right: containerStack.rightAnchor)

        let containerStackViews = [iconImageView, titleLabel, arrowImageView]
        containerStack.addArrangedSubviews(containerStackViews)
        containerStack.layoutMargins = UIEdgeInsets(top: 26, left: 0, bottom: 18, right: 0)
        containerStack.isLayoutMarginsRelativeArrangement = true

        containerStack.axis = .horizontal
        containerStack.spacing = 25
        containerStack.distribution = .fill
        return containerStack
    }
    
    
    private func layout() {
        layoutUserImageView()
        layoutBasicInformationStack()
        layoutBalanceStack()
        layoutButtonsStack()
        layoutBackGroundImageView()

    }
    
    private func layoutBackGroundImageView() {
        addSubview(backGroundImage)
        backGroundImage.anchor(top: topAnchor, left: leftAnchor, bottom: balanceStack.centerYAnchor, right: rightAnchor)
    }
    
    private func layoutUserImageView() {
        let constant: CGFloat  = 60
        avatarImageView.anchor(widthConstant: constant, heightConstant: constant)
    }
    
    private func layoutBasicInformationStack() {
        contentView.addSubview(basicInformationStack)
        basicInformationStack.anchor(top: contentView.topAnchor,
                                     left: contentView.leftAnchor,
                                     right: contentView.rightAnchor,
                                     topConstant: 12,
                                     leftConstant: sidesPadding,
                                     rightConstant: sidesPadding)
    }
    
    private func layoutBalanceStack() {
        contentView.addSubview(balanceStack)
        balanceStack.anchor(top: basicInformationStack.bottomAnchor,
                            left: basicInformationStack.leftAnchor,
                            right: basicInformationStack.rightAnchor,
                            topConstant: 80)
    }

    private func layoutButtonsStack() {
        contentView.addSubview(buttonsStack)
        buttonsStack.anchor(top: balanceStack.bottomAnchor,
                            left: basicInformationStack.leftAnchor,
                            bottom: contentView.bottomAnchor,
                            right: basicInformationStack.rightAnchor,
                            topConstant: 15)
    }
}
