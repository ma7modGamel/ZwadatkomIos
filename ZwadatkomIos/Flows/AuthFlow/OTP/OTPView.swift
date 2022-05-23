//
//  OTPView.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit

class OTPView: UIView {
    
    private var scrollView = UIScrollView(frame: .zero)
    private var contentView = UIView()
    
    private let headImageView = UIImageView(frame: .zero)
    private let headLabel = UILabel(frame: .zero)
    private let textFieldsStackView = OTPStackView(numberOfOTPDigit: 5)
    
    let sendButton = ZawadButton()
    let resendOTPCodeButton = ZawadButton()
    
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorName.whiteColor.color

        // configurations
        configureHeadImageView()
        //layout
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHeadImageView() {
        let image = UIImage(asset: Asset.otpHead)
        headImageView.image = image
        headImageView.contentMode = .scaleAspectFit
    }

}

extension OTPView {
    private func layoutViews() {
        layoutScrollView()
        layoutContentView()
        layoutHeadImageView()
    }
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
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
    
    private func layoutHeadImageView() {
        let imageConstant: CGFloat = UIScreen.main.bounds.width * 75
        contentView.addSubview(headImageView)
        headImageView.anchor(top: contentView.topAnchor,
                             widthConstant: imageConstant,
                             heightConstant: imageConstant)
        headImageView.anchorCenterXToSuperview()
    }
    
    private func layoutHeadLabel() {
        
    }
    
    private func layoutOTPTextStack() {
        
    }
    
    private func layoutSendButton() {
        
    }
    
    
}
