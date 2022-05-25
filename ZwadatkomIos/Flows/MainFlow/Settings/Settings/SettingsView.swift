//
//  SettingsView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit

class SettingsView: BaseUIView {
    
    let backGroundImage = UIImageView(frame: .zero)
    private var basicInformationStack = UIStackView(frame: .zero)
    private var avatarImageView = UIImageView(frame: .zero)
    private var userFullNameLabel = UILabel(frame: .zero)

    
    init() {
        super.init(frame: .zero)
        configureBackGroundImage()
        
        layoutBackGroundImageView()
        self.sendSubviewToBack(backGroundImage)
        self.headerView.backgroundColor = .clear
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
        basicInformationStack.layoutMargins = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        basicInformationStack.isLayoutMarginsRelativeArrangement = true
        basicInformationStack.backgroundColor = ColorName.whiteColor.color
    }

    private func configureUserImageView() {
//        let image = UIImage(asset: Asset.userImagePlaceHolder)
//        self.userImageView.image = image
    }
    
    
//    private func configureUserNameLabel() {
//        userFullNameLabel.textAlignment = .right
//        userFullNameLabel.numberOfLines = 0
//        let name = "يوسف محمد السروي"
//
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 0 //
//
//        let welcomeAttributes = [NSAttributedString.Key.font: UIFont(font: FontFamily.Cairo.bold, size: 18)]
//        let nameAttributes = [NSAttributedString.Key.foregroundColor: ColorName.propelColor.color,
//                               NSAttributedString.Key.font: UIFont(font: FontFamily.Cairo.regular, size: 16)]
//
//        let welcome = NSMutableAttributedString(string: L10n.welcome, attributes: welcomeAttributes as [NSAttributedString.Key : Any])
//        let nameAttributedString = NSMutableAttributedString(string: "\n\(name)", attributes: nameAttributes as [NSAttributedString.Key: Any])
//        welcome.append(nameAttributedString)
//        let range = NSMakeRange(0, welcome.length)
//        welcome.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: range)
//
//        userFullNameLabel.attributedText = welcome
//    }
//
    
    private func layoutBackGroundImageView() {
        addSubview(backGroundImage)
        backGroundImage.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
    }
    
//    private func layoutBasicInformationStack() {
//        contentView.addSubview(basicInformationStack)
//        basicInformationStack.anchor(top: contentView.topAnchor,
//                                     left: contentView.leftAnchor,
//                                     right: contentView.rightAnchor,
//                                     topConstant: 100,
//                                     leftConstant: sidePadding,
//                                     rightConstant: sidePadding)
//    }
}
