//
//  OrdersView.swift
//  Zwadatkom
//
//  Created by Yousef Mohamed on 02/06/2022.
//

import UIKit

class OrdersView: BaseUIView {
    typealias Layout = UICollectionViewCompositionalLayout
    var ordersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    init() {
        super.init(frame: .zero)
        configureTableView()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        ordersCollectionView.collectionViewLayout = generateCollectionViewLayout()
        ordersCollectionView.register(cellWithClass: OrderCell.self)
    }
    
    private func generateCollectionViewLayout() -> Layout {
        let paddingX = CGFloat(55)
        let paddingY = CGFloat(6)

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: paddingY, leading: paddingX, bottom: paddingY, trailing: paddingX)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count:  1)

        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func layout() {
        addSubview(ordersCollectionView)
        ordersCollectionView.anchor(top: headerView.bottomAnchor,
                               left: leftAnchor,
                               bottom: bottomAnchor,
                               right: rightAnchor)
    }
}
