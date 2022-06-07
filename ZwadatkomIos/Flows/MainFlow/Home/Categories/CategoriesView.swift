//
//  CategoriesView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import Foundation
import UIKit

class CategoriesView: BaseUIView {
    
    let categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    init() {
        super.init(frame: .zero)
        isHasSearchBar = true
        configureCategoriesCollectionView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCategoriesCollectionView() {
        categoriesCollectionView.collectionViewLayout = generateLayout()
        categoriesCollectionView.register(cellWithClass: LargeCategoryCell.self)
        categoriesCollectionView.register(SectionHeaderView.self,
                                          forSupplementaryViewOfKind: SupplementaryViewTypes.sectionHeader,
                                          withReuseIdentifier: SectionsHeaders.sectionHeader)
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            let width = layoutEnvironment.container.effectiveContentSize.width
            let insetX = CGFloat(55)
            let innerSpacing = CGFloat(10)

            let itemWidth = ( width - (insetX * 2) ) / 2
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth), heightDimension: .absolute(itemWidth))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: innerSpacing, trailing: 0)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(itemWidth))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: insetX, bottom: 0, trailing: insetX)
            group.interItemSpacing = .fixed(innerSpacing)
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                            elementKind: SupplementaryViewTypes.sectionHeader,
                                                                            alignment: .top)

            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [sectionHeader]
            return section
        }
        return layout
    }
    
    private func layout() {
        addSubview(categoriesCollectionView)
        categoriesCollectionView.anchor(top: headerView.bottomAnchor,
                                        left: leftAnchor,
                                        bottom: bottomAnchor,
                                        right: rightAnchor)
    }
}
