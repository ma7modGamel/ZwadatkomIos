//
//  SearchView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 06/06/2022.
//

import UIKit

final class SearchView: BaseUIView {
    
    typealias Layout = UICollectionViewCompositionalLayout
    let searchCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    init() {
        super.init(frame: .zero)
        viewTitleLabel.text = L10n.searchControllerTitle
        configureCollectionView()
        layout()
        isHasSearchBar = true
    }
    
    private func configureCollectionView() {
        searchCollectionView.collectionViewLayout = generateLayout()
        searchCollectionView.register(cellWithClass: ProductCell.self)
        searchCollectionView.register(NoResultHeaderView.self,
                                      forSupplementaryViewOfKind: supplementaryViewTypes.noResultHeaderView.rawValue,
                                      withReuseIdentifier: SectionsHeaders.sectionHeader)
        searchCollectionView.register(SectionHeaderView.self,
                                      forSupplementaryViewOfKind: supplementaryViewTypes.sectionHeader.rawValue,
                                      withReuseIdentifier: SectionsHeaders.sectionHeader)
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        
        let noResultViewSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1))
        let noResultView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: noResultViewSize,
                                                                        elementKind: supplementaryViewTypes.noResultHeaderView.rawValue,
                                                                        alignment: .top)
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(25))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: supplementaryViewTypes.sectionHeader.rawValue,
                                                                        alignment: .top)
        
        section.boundarySupplementaryItems = [noResultView, sectionHeader]
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 55, bottom: 0, trailing: 55)
        return Layout(section: section)
    }
    
    private func layout() {
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        addSubview(searchCollectionView)
        searchCollectionView.anchor(top: headerView.bottomAnchor,
                                  left: leftAnchor,
                                  bottom: bottomAnchor,
                                  right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
