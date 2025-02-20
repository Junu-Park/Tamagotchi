//
//  SelectCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

final class SelectCollectionViewCell: UICollectionViewCell {
    static let id: String = "SelectCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
