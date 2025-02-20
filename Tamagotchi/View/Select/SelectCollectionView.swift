//
//  SelectCollectionView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

final class SelectCollectionView: UICollectionView {
    
    init() {
        let layout = UICollectionViewFlowLayout()
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.register(SelectCollectionViewCell.self, forCellWithReuseIdentifier: SelectCollectionViewCell.id)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
