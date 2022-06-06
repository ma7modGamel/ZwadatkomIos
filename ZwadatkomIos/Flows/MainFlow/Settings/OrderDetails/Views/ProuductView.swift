//
//  ProuductView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 06/06/2022.
//

import UIKit

class ProductView: UIView {
    let container = UIView(frame: .zero)
    let productImage = UIImageView(frame: .zero)
    let productNameTitle = UILabel(frame: .zero)
    let quantityLabel = UILabel(frame: .zero)
    let priceLabel = UILabel(frame: .zero)
    
    init(cartItem: CartItem) {
        super.init(frame: .zero)
        configureLabels()
        configureView(with: cartItem)
        configureContainerView()
        layout()
    }
    
    private func configureView(with cartItem: CartItem) {
        guard let image = cartItem.product.images.first?.image else { return }
        guard let imageURL = URL(string: image) else { return }
        productImage.kf.setImage(with: imageURL)
        priceLabel.text = "\(String(cartItem.price)) \(L10n.sar)"
        quantityLabel.text = String(cartItem.quantity)
        self.productNameTitle.text = cartItem.product.name

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContainerView() {
        container.backgroundColor = ColorName.offGray.color
        container.layerCornerRadius = 12
    }
    
    private func configureLabels() {
        priceLabel.font = FontFamily.BahijTheSansArabic.bold.font(size: 14)
        productNameTitle.font = FontFamily.BahijTheSansArabic.semiBold.font(size: 14)
        quantityLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 12)
        priceLabel.textColor = ColorName.greenColor.color
    }
    
    private func layout() {
        layoutContainer()
        layoutImageView()
        layoutQuantityLabel()
        layoutProductNameTitle()
        layoutPriceLabel()
    }
    
    func layoutContainer() {
        addSubview(container)
        container.fillToSuperview()
    }
    
    func layoutImageView() {
        container.addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: container.topAnchor,constant: 26),
            productImage.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 21),
            productImage.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -26),
            productImage.heightAnchor.constraint(equalToConstant: 60),
            productImage.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func layoutQuantityLabel() {
        container.addSubview(quantityLabel)
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quantityLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            quantityLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 35),
            quantityLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
    }
    
    func layoutProductNameTitle() {
        container.addSubview(productNameTitle)
        productNameTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productNameTitle.bottomAnchor.constraint(equalTo: quantityLabel.topAnchor),
            productNameTitle.leadingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),
        ])
    }
    
    private func layoutPriceLabel() {
        container.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: quantityLabel.leadingAnchor),
        ])
    }
}
