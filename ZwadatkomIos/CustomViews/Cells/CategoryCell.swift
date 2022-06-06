//
//  CategoryCell.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 26/05/2022.
//

import UIKit
import Combine

class CategoryCell: UICollectionViewCell {
    
    private let container = UIView(frame: .zero)
    private let imageContainer = UIView(frame: .zero)
    private let categoryImageView = UIImageView(frame: .zero)
    private let titleLabel = UILabel(frame: .zero)
    
    let tapGesture = UITapGestureRecognizer()
    var tapSubscriptionCancelableToken: AnyCancellable?
    
    override var isSelected: Bool {
        willSet {
            switch newValue {
            case true:
                self.imageContainer.layerBorderColor =  ColorName.greenColor.color
                self.imageContainer.layerBorderWidth = 1
            case false:
                self.imageContainer.layerBorderWidth = 0
            }
        }
    }
    override init(frame: CGRect) {
      super.init(frame: frame)
        configureContainer()
        configureCategoryImageView()
        configureTitleLabel()
        
        layout()
    }
    
    override func prepareForReuse() {
        tapSubscriptionCancelableToken = nil
    }
    
    func configure(with category: Category) {
        guard let url = URL(string: category.image) else { return }
        categoryImageView.kf.setImage(with: url)
        imageContainer.backgroundColor = UIColor(hexString: category.color)
        isSelected = category.isSelected
        titleLabel.text = category.name
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContainer() {
        container.addGestureRecognizer(tapGesture)
    }
    
    private func configureCategoryImageView() {
        imageContainer.layerCornerRadius = 12
        categoryImageView.image = categoryImageView.image?.scaled(toWidth: 36, opaque: true)
    }
    
    private func configureTitleLabel() {
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(font: FontFamily.BahijTheSansArabic.plain, size: 14)
    }
    
    private func layout() {
        layoutContainer()
        layoutImageContainer()
        layoutCategoryImage()
        layoutCategoryTitle()
    }
    
    private func layoutContainer() {
        contentView.addSubview(container)
        container.fillToSuperview()
    }
    private func layoutImageContainer() {
        container.addSubview(imageContainer)
            imageContainer.anchor(top:container.topAnchor,
                                  left: container.leftAnchor,
                                  right: container.rightAnchor,
                                  heightConstant: 70)
    }
    private func layoutCategoryImage() {
        imageContainer.addSubview(categoryImageView)
        categoryImageView.anchorCenterSuperview()
        categoryImageView.anchor(widthConstant: 36, heightConstant: 36)
    }
    
    private func layoutCategoryTitle() {
        container.addSubview(titleLabel)
        titleLabel.anchor(top: imageContainer.bottomAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right:  container.rightAnchor)
    }
}
