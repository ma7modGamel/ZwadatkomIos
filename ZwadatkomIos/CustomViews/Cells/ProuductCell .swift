//
//  ProductCell .swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 26/05/2022.
//

import Foundation
import UIKit

class ProductCell: UICollectionViewCell {
    
    private let container = UIView(frame: .zero)
    private let productImageView = UIImageView(frame: .zero)
    private let productNameLabel = UILabel(frame: .zero)
    private let productDescriptionLabel = UILabel(frame: .zero)
    private let productPriceLabel = UILabel(frame: .zero)
    let addToCartButton = UIButton()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        configureContainer()
        configureProductNameLabel()
        configureDescriptionLabel()
        configureAddToCartButton()
        configurePriceLabel()
        configurePriceLabel()
        
        layout()
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with product: Product) {
        guard let url = URL(string: product.images.first?.image) else { return }
        productImageView.kf.setImage(with: url)
        productNameLabel.text = product.name
        productDescriptionLabel.text = product.productDescription
        productPriceLabel.text = "\(product.price) \(L10n.sar)"
    }
    
    private func configureContainer () {
        container.layerCornerRadius = 12
        container.backgroundColor = ColorName.offGray.color
    }
    
    private func configureProductNameLabel() {
        productNameLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.plain, size: 14)
        productNameLabel.textColor = ColorName.blackColor.color
    }
    private func configureDescriptionLabel() {
        productDescriptionLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.light, size: 10)
        productDescriptionLabel.textColor = ColorName.grayColor.color
    }
    
    private func configurePriceLabel() {
        productPriceLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 12)
        productPriceLabel.textColor = ColorName.greenColor.color
    }
    
    private func configureAddToCartButton() {
        addToCartButton.backgroundColor = ColorName.greenColor.color
        let image = UIImage(asset: Asset.plusIcon)
        addToCartButton.setImage(image, for: .normal)
    }
    
}

extension ProductCell {
    private func layout() {
        layoutContainer()
        layoutAddToCartButton()
        layoutProductImageView()
        layoutProductNameLabel()
        layoutProductDescriptionLabel()
        layoutProductPriceLabel()
    }
    
    private func layoutContainer() {
        contentView.addSubview(container)
        container.fillToSuperview()
    }
    
    private func layoutProductImageView() {
        container.addSubview(productImageView)
        productImageView.anchor(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor)
        productImageView.heightAnchor.constraint(equalToConstant: contentView.bounds.width * (2/3)).isActive = true
    }
    
    private func layoutProductNameLabel() {
        container.addSubview(productNameLabel)
        productNameLabel.anchor(top: productImageView.bottomAnchor,
                                left: container.leftAnchor,
                                right: container.rightAnchor,
                                topConstant: 10,
                                rightConstant: 10)
    }
    private func layoutProductDescriptionLabel() {
        container.addSubview(productDescriptionLabel)
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor,
                                       left: productNameLabel.leftAnchor,
                                       bottom: addToCartButton.topAnchor,
                                       right: productNameLabel.rightAnchor)
    }
    
    private func layoutAddToCartButton() {
        let buttonConstant: CGFloat = 35
        container.addSubview(addToCartButton)
        addToCartButton.anchor(left: container.leftAnchor,
                               bottom: container.bottomAnchor,
                               widthConstant: buttonConstant,
                               heightConstant: buttonConstant)
    }
    
    private func layoutProductPriceLabel() {
        container.addSubview(productPriceLabel)
        productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productPriceLabel.leadingAnchor.constraint(equalTo: productNameLabel.leadingAnchor),
            productPriceLabel.centerYAnchor.constraint(equalTo: addToCartButton.centerYAnchor),
        
        ])
    }
}
