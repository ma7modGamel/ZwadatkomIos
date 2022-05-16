//
//  SplashView.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 15/05/2022.
//

import UIKit
import SwifterSwift

class SplashView: UIView {
    
    private var logoImageView = UIImageView(frame: .zero)
    private var cornerLogo = UIImageView(frame: .zero)
    
    init() {
        super.init(frame: .zero)
        backgroundColor = ColorName.lightGray.color
        configureLogoImageView()
        configureCornerLogo()
        layoutLogoImageView()
        layoutCornerLogo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLogoImageView() {
        let image = UIImage(asset: Asset.logo)
        logoImageView.image = image
        logoImageView.contentMode = .scaleAspectFit
    }
    
    private func configureCornerLogo() {
        let image = UIImage(asset: Asset.cornerLogo)
        cornerLogo.image = image
        cornerLogo.contentMode = .scaleAspectFit
    }
    
    private func layoutLogoImageView() {
        addSubview(logoImageView)
        logoImageView.anchorCenterSuperview()
    }
    
    private func layoutCornerLogo() {
        addSubview(cornerLogo)
        cornerLogo.anchor(left: leftAnchor, bottom: bottomAnchor)
    }
}
