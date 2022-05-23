//
//  BaseUIView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit

class BaseUIView: UIView {
    
    internal var headerView = UIView(frame: .zero)
    internal var viewTitleLabel = UILabel(frame: .zero)
    internal var backButton = UIButton(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layoutHeaderView() {
        self.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func configureBackButton() {
        
    }
    
    private func layoutBackButton() {
        headerView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: headerView.topConstraint),
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor)
        
        ])
        
    }
    private var func layoutTitleLabel() {
        
    }

}
