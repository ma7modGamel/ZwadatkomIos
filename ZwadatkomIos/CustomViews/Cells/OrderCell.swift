//
//  OrderCell.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit

class OrderCell: UICollectionViewCell {
    
    let paddingX = CGFloat(20)
    let paddingTop = CGFloat(16)
    let containerView = UIView(frame: .zero)
    
    private var orderIdTitleLabel = UILabel()
    private var orderIdNumber = UILabel()
    private var orderStatusLabel = UILabel()
    private var orderDateLabel = UILabel(frame: .zero)
    
    var orderTapGesture = UITapGestureRecognizer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContainerView()
        configureOrderIdLabel()
        configureOrderNumberLabel()
        configureStatusLabel()
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with order: Order) {
        orderDateLabel.text = order.created
        orderIdNumber.text =  String(order.id)
    }
    
    private func configureContainerView() {
        containerView.addGestureRecognizer(orderTapGesture)
        containerView.backgroundColor =  ColorName.offGray.color
        containerView.layerCornerRadius = 12
    }
    
    private func configureOrderIdLabel() {
        orderIdTitleLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.light, size: 12)
        orderIdTitleLabel.textColor = ColorName.darkGray.color
        orderIdTitleLabel.text = L10n.ordersCellOrderNumber
    }
    private func configureOrderNumberLabel() {
        orderIdNumber.textColor = ColorName.blackColor.color
        orderIdNumber.font = UIFont(font: FontFamily.BahijTheSansArabic.semiLight, size: 12)
        
    }
    
    private func configureStatusLabel() {
        orderStatusLabel.text = L10n.orderStatusLabel
        orderStatusLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.light, size: 10)
    }
    
    private func layout() {
        layoutContainerView()
        layoutOrderIdLabel()
        layoutOrderNumberLabel()
        layoutOrderStatusLabel()
        layoutOrderDateLabel()
    }
    
    private func layoutContainerView() {
        contentView.addSubview(containerView)
        containerView.fillToSuperview()
    }
    
    private func layoutOrderIdLabel() {
        containerView.addSubview(orderIdTitleLabel)
        orderIdTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderIdTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: paddingTop),
            orderIdTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant:  paddingX)
        ])
    }
    private func layoutOrderNumberLabel() {
        containerView.addSubview(orderIdNumber)
        orderIdNumber.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderIdNumber.leadingAnchor.constraint(equalTo: orderIdTitleLabel.trailingAnchor, constant: 6),
            orderIdNumber.centerYAnchor.constraint(equalTo: orderIdTitleLabel.centerYAnchor),
        ])
    }
    
    private func layoutOrderStatusLabel() {
        containerView.addSubview(orderStatusLabel)
        orderStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderStatusLabel.topAnchor.constraint(equalTo: orderIdTitleLabel.bottomAnchor, constant: 12),
            orderStatusLabel.leadingAnchor.constraint(equalTo: orderIdTitleLabel.leadingAnchor)
        ])
    }
    
    private func layoutOrderDateLabel() {
        containerView.addSubview(orderDateLabel)
        orderDateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orderDateLabel.centerYAnchor.constraint(equalTo: orderIdTitleLabel.centerYAnchor),
            orderDateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddingX),
        
        ])
    }
    
    
}
