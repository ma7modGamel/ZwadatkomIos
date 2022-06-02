//
//  CategoryHeader.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 30/05/2022.
//

import UIKit
import Combine

class CategoryHeaderView: UICollectionReusableView {
    
    let titleLAbel = UILabel()
    let viewCategoriesButton = UIButton()
    var tapCancelableToken: AnyCancellable?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureShowAllButton()

    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension CategoryHeaderView {
    func configure() {
        backgroundColor = .clear
        let insetX = CGFloat(0)
        let insetY = CGFloat(30)

        addSubview(titleLAbel)
        addSubview(viewCategoriesButton)
        
        
        
        titleLAbel.translatesAutoresizingMaskIntoConstraints = false
        viewCategoriesButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLAbel.adjustsFontForContentSizeCategory = true
        
        NSLayoutConstraint.activate([
            viewCategoriesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insetX),
            viewCategoriesButton.topAnchor.constraint(equalTo: topAnchor, constant:  insetY),
            viewCategoriesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insetY),
            
            titleLAbel.topAnchor.constraint(equalTo: topAnchor, constant: insetY),
            titleLAbel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insetY),
            
            titleLAbel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insetX),
            titleLAbel.trailingAnchor.constraint(equalTo: viewCategoriesButton.leadingAnchor, constant: -insetX),

        ])
        titleLAbel.font = UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 14)
    }
    
    private func configureShowAllButton() {
        viewCategoriesButton.setTitleForAllStates(L10n.showAllCategoriesButton)
        viewCategoriesButton.setTitleColorForAllStates(ColorName.greenColor.color)
        viewCategoriesButton.titleLabel?.font = UIFont(font: FontFamily.BahijTheSansArabic.semiLight, size: 12)
    }
}
