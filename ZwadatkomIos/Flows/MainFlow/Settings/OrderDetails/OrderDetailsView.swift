//
//  OrderDetailsView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 05/06/2022.
//

import UIKit

class OrderDetailsView: BaseUIView {
    
    let orderIdLabel = UILabel(frame: .zero)
    let orderIdNumber = UILabel(frame: .zero)
    let orderStatusStack = UIStackView(frame: .zero)
    let productsStack = UIStackView(frame: .zero)
    let orderPriceStack = UIStackView(frame: .zero)
    
    let paddingX = CGFloat(55)
    
    init() {
        super.init(frame: .zero)
        viewTitleLabel.text = L10n.orderDetailsControllerTitle
        configureLabels()
        layout()
    }
    
    func configureView(with order: Order) {
        orderIdLabel.text = L10n.orderNumberLabel
        orderIdNumber.text = String(order.id)
        guard let cartItem = order.cart.cartItems else { return }
        configurePriceStack(with: order.cart)
        configureProductsStack(with: cartItem)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabels() {
        orderIdLabel.font = FontFamily.BahijTheSansArabic.light.font(size: 12)
        orderIdNumber.font = FontFamily.BahijTheSansArabic.semiLight.font(size: 15)
        orderIdLabel.textColor = ColorName.darkGray.color
        orderIdNumber.textColor = ColorName.blackColor.color
    }
    
    private func configureProductsStack(with list: [CartItem]) {
        productsStack.axis = .vertical
        productsStack.distribution = .fillEqually
        productsStack.spacing = 8
        for cartItem in list {
            let view = ProductView(cartItem: cartItem)
            productsStack.addArrangedSubview(view)
        }
    }
    
    private func configurePriceStack(with cart: Cart) {
        let priceView = priceStackView(title: L10n.priceLabel, price: String(cart.total))
        let discountView = priceStackView(title: L10n.discountLabel, price: String(cart.total), textColor: UIColor(hexString: "F47E81"))
        let totalPrice = priceStackView(title: L10n.totalLabel, price: String(cart.total))
        let stackViews = [priceView, discountView, totalPrice]
        orderPriceStack.addArrangedSubviews(stackViews)
        orderPriceStack.distribution = .fillEqually
        orderPriceStack.axis = .vertical
        let lineColor = UIColor(hexString: "C4C4C4")!.cgColor
        orderPriceStack.addLineDashedStroke(pattern: [6, 4], radius: 0, color: lineColor)
    }
    
    private func priceStackView(title: String, price: String, textColor: UIColor? = ColorName.blackColor.color) -> UIView {
        let titleLabel = UILabel(text:  title)
        let priceLabel = UILabel(text: price)
        let view = UIView(frame: .zero)
        titleLabel.textColor = textColor
        priceLabel.textColor = textColor
        titleLabel.font = FontFamily.BahijTheSansArabic.extraLight.font(size: 14)
        priceLabel.font = FontFamily.BahijTheSansArabic.semiBold.font(size: 14)
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        view.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        return view
    }
    
    private func layout() {
        layoutOrderIdNumber()
        layoutOrderIdLabel()
        layoutStatusStack()
        layoutProductsContainer()
        layoutPriceStack()

    }
    
    private func layoutOrderIdNumber() {
        contentView.addSubview(orderIdNumber)
        orderIdNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderIdNumber.topAnchor.constraint(equalTo: contentView.topAnchor),
            orderIdNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -paddingX)
        ])
    }
    
    private func layoutOrderIdLabel() {
        contentView.addSubview(orderIdLabel)
        orderIdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderIdLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            orderIdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: paddingX),
            orderIdLabel.trailingAnchor.constraint(equalTo: orderIdNumber.leadingAnchor),
        ])
    }
    
    private func layoutStatusStack() {
        contentView.addSubview(orderStatusStack)
        orderStatusStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderStatusStack.topAnchor.constraint(equalTo: orderIdLabel.bottomAnchor, constant: 26),
            orderStatusStack.leadingAnchor.constraint(equalTo: orderIdLabel.leadingAnchor),
            orderStatusStack.trailingAnchor.constraint(equalTo: orderIdNumber.trailingAnchor)
        ])
    }
    
    private func layoutProductsContainer() {
        contentView.addSubview(productsStack)
        productsStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productsStack.topAnchor.constraint(equalTo: orderStatusStack.bottomAnchor),
            productsStack.leadingAnchor.constraint(equalTo: orderIdLabel.leadingAnchor),
            productsStack.trailingAnchor.constraint(equalTo: orderIdNumber.trailingAnchor),
        
        ])
    }
    private func layoutPriceStack() {
        contentView.addSubview(orderPriceStack)
        orderPriceStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderPriceStack.topAnchor.constraint(equalTo: productsStack.bottomAnchor, constant: 30),
            orderPriceStack.leadingAnchor.constraint(equalTo: orderIdLabel.leadingAnchor),
            orderPriceStack.trailingAnchor.constraint(equalTo: orderIdNumber.trailingAnchor),
            orderPriceStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}



