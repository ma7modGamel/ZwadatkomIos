//
//  HomeView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 25/05/2022.
//

import UIKit

class HomeView: BaseUIView {
    
    typealias Layout = UICollectionViewCompositionalLayout
    
    var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    init(){
        super.init(frame: .zero)
        
        layoutCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutCollectionView() {
        addSubview(homeCollectionView)
        homeCollectionView.anchor(top: headerView.bottomAnchor,
                                  left: leftAnchor,
                                  bottom: bottomAnchor,
                                  right: rightAnchor)
    }
    
    
    func generateLayout() -> UICollectionViewLayout {
        
      let layout = Layout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
        let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500

        let sectionLayoutKind = HomeSection.allCases[sectionIndex]
        switch (sectionLayoutKind) {
        case .Banners:
            return self.generateBannersLayout(isWide: isWideView)
        case .Categories:
            return self.generateBannersLayout(isWide: isWideView)
        case .Products:
            return self.generateBannersLayout(isWide: isWideView)
        }
      }
      return layout
    }
    
    func generateBannersLayout(isWide: Bool) -> NSCollectionLayoutSection {
      let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                            heightDimension: .fractionalWidth(2/3))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)

      // Show one item plus peek on narrow screens, two items plus peek on wider screens
      let groupFractionalWidth = isWide ? 0.475 : 0.95
      let groupFractionalHeight: Float = isWide ? 1/3 : 2/3
      let groupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(CGFloat(groupFractionalWidth)),
        heightDimension: .fractionalWidth(CGFloat(groupFractionalHeight)))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
      group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

      let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(44))
//      let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
//        layoutSize: headerSize,
//        elementKind: AlbumsViewController.sectionHeaderElementKind, alignment: .top)

      let section = NSCollectionLayoutSection(group: group)
      //section.boundarySupplementaryItems = [sectionHeader]
      section.orthogonalScrollingBehavior = .groupPaging

      return section
    }
    
}
