//
//  BaseUIView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 23/05/2022.
//

import UIKit

class BaseUIView: UIView {
    
    internal final let scrollView = UIScrollView(frame: .zero)
    internal final let contentView = UIView(frame: .zero)
    

    private final let buttonTopPadding: CGFloat = 25
    private final let buttonFixedHeight: CGFloat = 36
    
    internal var headerView = UIView(frame: .zero)
    internal var viewTitleLabel = UILabel(frame: .zero)
    internal var backButton = UIButton(frame: .zero)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeaderView()
        configureBackButton()
        configureScrollView()
        
        layoutBackButton()
        layoutTitleLabel()
        layoutHeaderView()
        layoutScrollView()
        layoutContentView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureScrollView() {
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func configureHeaderView() {
        headerView.backgroundColor = ColorName.whiteColor.color
    }
    
    private func configureBackButton() {
        guard let image = UIImage(asset: Asset.backIndicator) else { return }
        backButton.setImageForAllStates(image)
    }

    private func layoutHeaderView() {
        self.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //headerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 85)
        ])
    }
    
    private func layoutBackButton() {
        headerView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: buttonTopPadding),
            backButton.bottomAnchor.constraint(greaterThanOrEqualTo: headerView.bottomAnchor, constant: -buttonTopPadding),
            backButton.heightAnchor.constraint(equalToConstant: buttonFixedHeight),
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: Measurements.leadingPadding)
        ])
    }
    
    private func layoutTitleLabel() {
        headerView.addSubview(viewTitleLabel)
        viewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewTitleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            viewTitleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        ])
    }

    private func layoutScrollView() {
        addSubview(scrollView)
        scrollView.anchor(
            top: headerView.bottomAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor)
    }
    private func layoutContentView() {
        scrollView.addSubview(contentView)
        contentView.anchor(top: scrollView.contentLayoutGuide.topAnchor,
                           left: scrollView.contentLayoutGuide.leftAnchor,
                           bottom: scrollView.contentLayoutGuide.bottomAnchor,
                           right: scrollView.contentLayoutGuide.rightAnchor)
        contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
}
