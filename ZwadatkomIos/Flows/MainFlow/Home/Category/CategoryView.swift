//
//  CategoryView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 31/05/2022.
//

import UIKit

class CategoryView: BaseUIView {
    
    typealias Layout = UICollectionViewCompositionalLayout
    
    private var insetX = CGFloat(50)
    private var insetY = CGFloat(5)
    
    var categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    init(){
        super.init(frame: .zero)
        configureCollectionView()
        layoutCollectionView()
        isHasSearchBar = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        categoryCollectionView.collectionViewLayout = generateLayout()
        categoryCollectionView.allowsMultipleSelection = false
        categoryCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        categoryCollectionView.register(cellWithClass: CategoryCell.self)
        categoryCollectionView.register(cellWithClass: ProductCell.self)
    }
    
    func generateLayout() -> UICollectionViewLayout {
      let layout = Layout { (sectionIndex, layoutEnvironment)  in
        let sectionLayoutKind = CategorySection.allCases[sectionIndex]
        switch (sectionLayoutKind) {
        case .categories:
            return self.generateCategoriesLayout()
        case .products:
            return self.generateProductsLayout()
        }
      }
      return layout
    }
    
    private func generateCategoriesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)


        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(70), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.interItemSpacing = .fixed(10)
//        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)

        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: insetX, bottom: 30, trailing: insetX)
        return section
    }
    
    
    
    
    
    private func generateProductsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(55))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        //group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 55, bottom: 10, trailing: 55)


        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets =  NSDirectionalEdgeInsets(top: 0, leading: 55, bottom: 10, trailing: 55)

        return section
    }
    
    private func layoutCollectionView() {
        addSubview(categoryCollectionView)
        categoryCollectionView.anchor(top: headerView.bottomAnchor,
                                  left: leftAnchor,
                                  bottom: bottomAnchor,
                                  right: rightAnchor)
    }
}
