//
//  NoResultHeaderView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 07/06/2022.
//

import UIKit
import Combine

class NoResultHeaderView: UICollectionReusableView {
    
    private let container = UIView(frame: .zero)
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let imageView = UIImageView(frame: .zero)

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
        configureTitleLabel()
        configureSubTitle()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureImageView() {
        imageView.image = Asset.noSearchResultIcon.image
    }
 
    private func configureTitleLabel() {
        titleLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 16)
        titleLabel.textAlignment = .center
        titleLabel.text = L10n.noSearchResultTitle
    }
    
    private func configureSubTitle() {
        subTitleLabel.font = FontFamily.BahijTheSansArabic.extraLight.font(size: 12)
        subTitleLabel.textAlignment = .center
        subTitleLabel.text = L10n.noSearchResultSubTitle
    }
}

extension NoResultHeaderView {
    
    private func layout() {
        layoutContainer()
        layoutTitleLabel()
        layoutImageView()
        layoutSubTitleLabel()
    }
    
    private func layoutContainer() {
        addSubview(container)
        container.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor,
                         heightConstant: UIScreen.main.bounds.width)
    }
    
    private func layoutTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.anchorCenterSuperview()
    }
    
    private func layoutImageView() {
        container.addSubview(imageView)
        imageView.anchor(bottom: titleLabel.topAnchor, bottomConstant: 25)
        imageView.anchorCenterXToSuperview()
    }
    
    private func layoutSubTitleLabel() {
        container.addSubview(subTitleLabel)
        subTitleLabel.anchorCenterXToSuperview()
        subTitleLabel.anchor(top: titleLabel.bottomAnchor)
    }
}
