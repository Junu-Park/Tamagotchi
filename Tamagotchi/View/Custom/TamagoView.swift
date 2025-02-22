//
//  TamagoView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/21/25.
//

import UIKit

import SnapKit

final class TamagoView: BaseView {
    
    private let tamagoImage: UIImageView = UIImageView(image: .no)
    private let tamagoName: InsetLabel = InsetLabel(inset: 4)
    
    var type: TamagoType {
        didSet {
            self.tamagoName.text = type.name
            self.tamagoImage.image = UIImage(named: type.imageString)
        }
    }
    
    init(type: TamagoType) {
        self.type = type
        
        super.init()
        
        self.configureHierarchy()
        self.configureLayout()
        self.configureView()
    }
    
    override func configureHierarchy() {
        self.addSubview(self.tamagoImage)
        self.addSubview(self.tamagoName)
    }
    
    override func configureLayout() {
        self.tamagoImage.setContentHuggingPriority(.defaultLow, for: .vertical)
        self.tamagoName.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        self.tamagoImage.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.width.equalTo(self.tamagoImage.snp.height)
        }
        self.tamagoName.snp.makeConstraints { make in
            make.top.equalTo(self.tamagoImage.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()
        }
    }
    
    override func configureView() {
        self.tamagoImage.contentMode = .scaleAspectFit
        self.tamagoImage.clipsToBounds = true
        DispatchQueue.main.async {
            self.tamagoImage.layer.cornerRadius = self.tamagoImage.frame.height / 2
        }
        
        self.tamagoName.font = .systemBold13
        self.tamagoName.layer.cornerRadius = 5
        self.tamagoName.layer.borderColor = UIColor.border.cgColor
        self.tamagoName.layer.borderWidth = 1
        self.tamagoName.backgroundColor = .background
        self.tamagoName.textAlignment = .center
    }
}
