//
//  SelectCollectionView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

final class SelectCollectionView: UICollectionView {
    
    init() {
        let countCellPerRow: Double = 3
        let sideSpacing: Double = 24
        let cellSpacing: Double = 24
        let lineSpacing: Double = 24
        
        let spacing: Double = (sideSpacing * 2) + (cellSpacing * (countCellPerRow - 1))
        
        let itemWidth = (UIScreen.main.bounds.width - spacing) / (countCellPerRow)
        let itemHeight = UIScreen.main.bounds.height / 7
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = lineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
        self.register(SelectCollectionViewCell.self, forCellWithReuseIdentifier: SelectCollectionViewCell.id)
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.contentInset = .init(top: 24, left: sideSpacing, bottom: 24, right: sideSpacing)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
