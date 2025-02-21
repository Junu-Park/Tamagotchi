//
//  SelectCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

import SnapKit

final class SelectCollectionViewCell: UICollectionViewCell, ConfigureProtocol {
    
    static let id: String = "SelectCollectionViewCell"
    
    let tamagoView: TamagoView = TamagoView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configureView()
        self.configureHierarchy()
        self.configureLayout()
    }
    
    func configureHierarchy() {
        self.contentView.addSubview(self.tamagoView)
    }
    
    func configureLayout() {
        self.tamagoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureView() { }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
