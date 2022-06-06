//
//  BannarCell.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 26/05/2022.
//

import UIKit
import Kingfisher

class BannerCell: UICollectionViewCell {
    
    let container = UIView(frame: .zero)
    let bannerImage = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        configureBannerImageView()
        layoutViews()
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with banner: Banner) {
        guard let url = URL(string: banner.image) else { return }
        print(url)
        bannerImage.kf.setImage(with: url)
    }
    
    private func configureBannerImageView() {
        bannerImage.layerCornerRadius = 12
    }
    
}


extension BannerCell {
    private func layoutViews() {
        contentView.addSubview(container)
        layoutBannerImage()
        container.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor)
    }
    
    private func layoutBannerImage() {
        container.addSubview(bannerImage)
        bannerImage.fillToSuperview()
    }
    
}
