//
//  ZawadButton.swift
//  ZwadatkomIos
//
//  Created by Yousef Mohamed on 22/05/2022.
//

import UIKit

class ZawadButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 52).isActive = true
        self.backgroundColor = ColorName.darkGreen.color
        self.titleLabel?.font = UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 14)
        self.layer.cornerRadius = 25
    }
}
