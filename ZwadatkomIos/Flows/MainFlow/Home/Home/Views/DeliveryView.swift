//
//  DeliveryView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 06/06/2022.
//

import UIKit

class DeliveryView: UIView {

    private var headLabel = UILabel(frame: .zero)
    var locationButton = UIButton(frame: .zero)
    var selectButton = UIButton(frame: .zero)
    var addressLabel = UILabel(frame: .zero)
    
    init() {
        super.init(frame: .zero)
        configureHeadLabel()
        configureLocationButton()
        configureSelectButton()
        configureAddressLabel()
        layout()
    }
    
    private func configureHeadLabel() {
        headLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 15)
        headLabel.text = L10n.deliveryHeadlabelTitle
        headLabel.textColor = ColorName.blackColor.color
    }
    private func configureAddressLabel() {
        addressLabel.font = FontFamily.BahijTheSansArabic.light.font(size: 12)
        addressLabel.textColor = ColorName.darkGray.color
    }
    
    private func configureLocationButton() {
        let placeHolderImage = Asset.locationButton.image
        locationButton.setImageForAllStates(placeHolderImage)
    }
    
    private func configureSelectButton() {
        let selectIcon = Asset.selectButton.image
        selectButton.setImageForAllStates(selectIcon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        layoutLocationButton()
        layoutHeadLabel()
        layoutSelectButton()
        layoutAddressLabel()
    }
    private func layoutLocationButton() {
        addSubview(locationButton)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            locationButton.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func layoutHeadLabel() {
        addSubview(headLabel)
        headLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headLabel.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor, constant: 10),
            headLabel.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    private func layoutAddressLabel() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: headLabel.bottomAnchor),
            addressLabel.leadingAnchor.constraint(equalTo: headLabel.leadingAnchor),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            addressLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        addressLabel.text = "السعودية , الرياض"
    }
    private func layoutSelectButton() {
        addSubview(selectButton)
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectButton.centerYAnchor.constraint(equalTo: headLabel.centerYAnchor),
            selectButton.leadingAnchor.constraint(equalTo: headLabel.trailingAnchor, constant: 10),
        ])
    }
}
