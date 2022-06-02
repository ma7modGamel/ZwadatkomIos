//
//  HomeView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit

class HomeView: BaseUIView {
    
    typealias Layout = UICollectionViewCompositionalLayout
    
    private var insetX = CGFloat(50)
    private var insetY = CGFloat(5)
    
    var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    init(){
        super.init(frame: .zero)
        configureCollectionView()
        
        layoutCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }
    
    
    private func layoutCollectionView() {
        addSubview(homeCollectionView)
        homeCollectionView.anchor(top: headerView.bottomAnchor,
                                  left: leftAnchor,
                                  bottom: bottomAnchor,
                                  right: rightAnchor)
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
                                            heightDimension: .fractionalWidth(2/3))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      // Show one item plus peek on narrow screens, two items plus peek on wider screens
      let groupFractionalWidth = 0.95
      let groupFractionalHeight: Float = 2/3
      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
        heightDimension: .fractionalWidth(CGFloat(groupFractionalHeight)))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
      group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

      let section = NSCollectionLayoutSection(group: group)
      section.orthogonalScrollingBehavior = .groupPaging

      return section
    }
    
    
    private func generateCategoriesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(70), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 5, bottom: 6, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 50, bottom: 6, trailing: 50)


        let section = NSCollectionLayoutSection(group: group)


        return section
    }
}
