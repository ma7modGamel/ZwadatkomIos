//
//  HomeView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit
import Alamofire

class HomeView: BaseUIView {
    
    typealias Layout = UICollectionViewCompositionalLayout
    
    private var insetX = CGFloat(45 )
    private var insetY = CGFloat(5)
    
    let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let deliveryView = DeliveryView()
    let menuButton = UIButton(frame: .zero)
    let searchButton = UIButton(frame: .zero)
    
    init(){
        super.init(frame: .zero)
        configureCollectionView()
        configureMenuButton()
        configureSearchButton()
        layoutCollectionView()
        layoutMenuButton()
        layoutSearchButton()
        layoutDeliveryView()
        self.backButton.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMenuButton() {
        let menuImage = Asset.menuButton.image
        menuButton.setImageForAllStates(menuImage)
    }
    
    private func configureSearchButton() {
        let searchImage = Asset.searchButton.image
        searchButton.setImageForAllStates(searchImage)
    }
    
    private func configureCollectionView() {
        homeCollectionView.collectionViewLayout = generateLayout()
        homeCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        homeCollectionView.register(cellWithClass: BannerCell.self)
        homeCollectionView.register(cellWithClass: CategoryCell.self)
        homeCollectionView.register(cellWithClass: ProductCell.self)
        homeCollectionView.register(CategoryHeaderView.self,
                                    forSupplementaryViewOfKind: SupplementaryViews.categoryHeader,
                                    withReuseIdentifier: SectionsHeaders.categoryHeader)
        homeCollectionView.register(SectionHeaderView.self,
                                    forSupplementaryViewOfKind: SupplementaryViews.sectionHeader,
                                    withReuseIdentifier: SectionsHeaders.sectionHeader)
    }
    
    private func layoutCollectionView() {
        addSubview(homeCollectionView)
        homeCollectionView.anchor(top: headerView.bottomAnchor,
                                  left: leftAnchor,
                                  bottom: bottomAnchor,
                                  right: rightAnchor)
    }
    
    private func layoutMenuButton() {
        self.headerView.addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: buttonTopPadding),
            menuButton.heightAnchor.constraint(equalToConstant: buttonFixedHeight),
            menuButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: Measurements.leadingPadding)
        ])
    }
    private func layoutSearchButton() {
        self.headerView.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: buttonTopPadding),
            searchButton.heightAnchor.constraint(equalToConstant: buttonFixedHeight),
            searchButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -Measurements.leadingPadding)
        ])
    }
    private func layoutDeliveryView() {
        self.headerView.addSubview(deliveryView)
        deliveryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deliveryView.topAnchor.constraint(equalTo: searchButton.topAnchor),
            deliveryView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
        ])
    }
    
    func generateLayout() -> UICollectionViewLayout {
      let layout = Layout { (sectionIndex, layoutEnvironment) in

        let sectionLayoutKind = HomeSection.allCases[sectionIndex]
        switch (sectionLayoutKind) {
        case .Banners:
            return self.generateBannersLayout()
        case .Categories:
            return self.generateCategoriesLayout()
        case .Products:
            return self.generateProductsLayout()
        }
      }
      return layout
    }
    
    func generateBannersLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.73),
                                               heightDimension: .fractionalWidth(2/5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0)
        section.interGroupSpacing = 10
        return section
    }
    
    private func generateCategoriesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(70), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(5), top: nil, trailing: .fixed(5), bottom: nil)

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: SupplementaryViews.categoryHeader,
                                                                        alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: insetX, bottom: 0, trailing: insetX)
        return section
    }
    
    private func generateProductsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                        elementKind: SupplementaryViews.sectionHeader,
                                                                        alignment: .top)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 55, bottom: 0, trailing: 55)
        section.boundarySupplementaryItems = [sectionHeader]
        section.interGroupSpacing = 10
        return section
    }
}


