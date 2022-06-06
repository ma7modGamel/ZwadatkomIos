//
//  LargeCategoryCell.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import UIKit
import Combine

class LargeCategoryCell: UICollectionViewCell {
        
    private let container = UIView(frame: .zero)
    private let categoryImageView = UIImageView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    private let productsCountLabel = UILabel(frame: .zero)
    
    let tapGesture = UITapGestureRecognizer()
    var tapSubscriptionCancelableToken:AnyCancellable?
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        configureContainer()
        configureCategoryImageView()
        configureTitleLabel()
        layout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tapSubscriptionCancelableToken = nil
    }
    
    func configure(with category: Category) {
        guard let url = URL(string: category.image) else { return }
        container.backgroundColor = UIColor(hexString: category.color)
        categoryImageView.kf.setImage(with: url)
        titleLabel.text = category.name
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContainer() {
        container.layerCornerRadius = 12
        container.addGestureRecognizer(tapGesture)
    }
    
    private func configureCategoryImageView() {
        
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 14)
    }
    
    private func layout() {
        layoutContainer()
        layoutCategoryImage()
        layoutCategoryTitle()
    }
    
    private func layoutContainer() {
        contentView.addSubview(container)
        container.fillToSuperview()
    }
    private func layoutCategoryImage() {
        container.addSubview(categoryImageView)
        categoryImageView.anchorCenterXToSuperview()
        categoryImageView.anchor(top: container.topAnchor,
                                 topConstant: 35,
                                 widthConstant: 46,
                                 heightConstant: 46)
    }
    private func layoutCategoryTitle() {
        container.addSubview(titleLabel)
        titleLabel.anchor(top: categoryImageView.bottomAnchor,
                          left: container.leftAnchor,
                          right:  container.rightAnchor,
                          topConstant: 12,
                          rightConstant: 15)
    }
    
    private func layoutProductsCountLabel() {
        container.addSubview(productsCountLabel)
    }
}
