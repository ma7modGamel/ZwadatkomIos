//
//  SectionHeaderView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import UIKit
import Combine

class SectionHeaderView: UICollectionReusableView {
    
    private let titleLAbel = UILabel()
    var sectionTitle: String? {
        willSet {
            titleLAbel.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        backgroundColor = .clear
        let insetX = CGFloat(55)
        let insetY = CGFloat(30)
        
        addSubview(titleLAbel)
        
        titleLAbel.translatesAutoresizingMaskIntoConstraints = false
        titleLAbel.adjustsFontForContentSizeCategory = true
        
        NSLayoutConstraint.activate([

            
            titleLAbel.topAnchor.constraint(equalTo: topAnchor, constant: insetY),
            titleLAbel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insetY),
            
            titleLAbel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insetX),
            titleLAbel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -insetX),
            
        ])
        titleLAbel.font = UIFont(font: FontFamily.BahijTheSansArabic.semiBold, size: 16)
    }
}
