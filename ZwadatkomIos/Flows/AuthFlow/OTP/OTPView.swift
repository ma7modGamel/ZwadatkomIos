//
//  OTPView.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit

final class OTPView: BaseUIView {
    
    private let headImageView = UIImageView(frame: .zero)
    private let headLabel = UILabel(frame: .zero)
    private let textFieldsStackView = OTPStackView(numberOfOTPDigit: 6)

    internal let sendButton = ZawadButton()
    internal let resendOTPCodeButton = ZawadButton()

    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color
        // configurations
        configureHeadImageView()
        configureHeadLabel()
        configureResendButton()
        configureSendButton()
        //layout
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeadImageView() {
        print("configureHeadImageView")
        let image = UIImage(asset: Asset.otpHead)
        headImageView.image = image
        headImageView.contentMode = .scaleAspectFit
    }
    
    private func configureHeadLabel() {
        headLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 22)
        headLabel.text = L10n.otpHeadTitle
        headLabel.textAlignment = .center
    }
    
    private func configureResendButton() {
        resendOTPCodeButton.setTitleForAllStates(L10n.otpSendButton)
        resendOTPCodeButton.setTitleColorForAllStates(ColorName.greenColor.color)
        resendOTPCodeButton.backgroundColor = ColorName.whiteColor.color
        resendOTPCodeButton.layerBorderColor = ColorName.greenColor.color
        resendOTPCodeButton.layerBorderWidth = 1
    }

    private func configureSendButton() {
        sendButton.setTitleForAllStates(L10n.otpResendButton)
    }
}

extension OTPView {
    private func layoutViews() {
        layoutHeadImageView()
        layoutHeadLabel()
        layoutOTPTextStack()
        layoutSendButton()
        layoutResendOTPCodeButton()
    }
    
    private func layoutHeadImageView() {
        let imageConstant: CGFloat = UIScreen.main.bounds.width * 0.65
        contentView.addSubview(headImageView)
        headImageView.anchor(top: contentView.topAnchor,
                             topConstant: 65,
                             widthConstant: imageConstant,
                             heightConstant: imageConstant)
        headImageView.anchorCenterXToSuperview()
    }

    private func layoutHeadLabel() {
        contentView.addSubview(headLabel)
        headLabel.anchor(top: headImageView.bottomAnchor,
                         left: contentView.leftAnchor,
                         right: contentView.rightAnchor,
                         topConstant: 30)
    }

    private func layoutOTPTextStack() {
        contentView.addSubview(textFieldsStackView)
        textFieldsStackView.anchor(top: headLabel.bottomAnchor,
                                   left: contentView.leftAnchor,
                                   right: contentView.rightAnchor,
                                   topConstant: 12,
                                   leftConstant: 55,
                                   rightConstant: 55,
                                   heightConstant: 55)
    }

    private func layoutSendButton() {
        contentView.addSubview(sendButton)
        sendButton.anchor(top: textFieldsStackView.bottomAnchor,
                          left: textFieldsStackView.leftAnchor,
                          right: textFieldsStackView.rightAnchor,
                          topConstant: 45)
    }
    
    private func layoutResendOTPCodeButton() {
        contentView.addSubview(resendOTPCodeButton)
        resendOTPCodeButton.anchor(top: sendButton.bottomAnchor,
                                   left: textFieldsStackView.leftAnchor,
                                   right: textFieldsStackView.rightAnchor,
                                   topConstant: 16)
        resendOTPCodeButton.bottomAnchor
            .constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -100)
            .isActive = true
    }
}
