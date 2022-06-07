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
    

    internal final let buttonTopPadding: CGFloat = 22
    internal final let buttonFixedHeight: CGFloat = 36
    
    private let searchStack = UIStackView(frame: .zero)
    internal var headerView = UIView(frame: .zero)
    internal var viewTitleLabel = UILabel(frame: .zero)
    internal var backButton = UIButton(frame: .zero)
    internal var filterButton = UIButton(frame: .zero)
    internal var searchBar = UISearchBar(frame: .zero)
    
    internal var isHasSearchBar: Bool = false {
        willSet {
            switch newValue {
            case true:
                stackBottomConstraint.constant = 55
            default:
                stackBottomConstraint.constant = 0
            }
        }
    }
    
    private var stackBottomConstraint: NSLayoutConstraint
    
    
    override init(frame: CGRect) {
        stackBottomConstraint = NSLayoutConstraint(item: searchStack,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: nil, attribute: .notAnAttribute,
                                                   multiplier: 1,
                                                   constant: 0)
        super.init(frame: frame)
        backgroundColor = ColorName.whiteColor.color
        configureHeaderView()
        configureBackButton()
        configureTitleLabel() 
        configureScrollView()
        configureFilterButton()
        configureSearchBar()
        configureSearchStackView()

        layoutBackButton()
        layoutTitleLabel()
        layoutHeaderView()
        layoutSearchStack()
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
    
    private func configureTitleLabel() {
        viewTitleLabel.font = FontFamily.BahijTheSansArabic.plain.font(size: 14)
    }
    
    private func configureBackButton() {
        guard let image = UIImage(asset: Asset.backIndicator) else { return }
        backButton.setImageForAllStates(image)
    }
    
    private func configureSearchStackView() {
        let stackViews = [searchBar, filterButton]
        searchStack.addArrangedSubviews(stackViews)
        searchStack.distribution = .fill
    }
    
    private func configureSearchBar() {
        searchBar.layerBorderColor = .clear
        searchBar.textField?.backgroundColor = ColorName.offGray.color
        searchBar.textField?.font = FontFamily.BahijTheSansArabic.semiLight.font(size: 10)
        searchBar.textField?.placeholder = "أكتب محتوي البحث"
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = ColorName.whiteColor.color
    }
    
    private func configureFilterButton() {
        guard let image = UIImage(asset: Asset.filterIcon) else { return }
        filterButton.setImageForAllStates(image)
        filterButton.layerCornerRadius = 12
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
            //backButton.bottomAnchor.constraint(greaterThanOrEqualTo: headerView.bottomAnchor, constant: -buttonTopPadding),
            backButton.heightAnchor.constraint(equalToConstant: buttonFixedHeight),
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: Measurements.leadingPadding)
        ])
    }
    private func layoutSearchStack() {
        headerView.addSubview(searchStack)
        searchStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchStack.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 22),
            stackBottomConstraint,
            searchStack.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -Measurements.leadingPadding),
            searchStack.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: Measurements.leadingPadding),
            searchStack.bottomAnchor.constraint(greaterThanOrEqualTo: headerView.bottomAnchor),
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
