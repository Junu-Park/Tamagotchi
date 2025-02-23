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
    
    lazy var tamagoType: TamagoType = .none {
        didSet {
            self.tamagoName.text = tamagoType.name
            self.tamagoImage.image = UIImage(named: tamagoType.imageString)
        }
    }
    
    init(tamagoType: TamagoType = .none) {
        
        super.init()
        
        self.tamagoType = tamagoType
        
        self.configureHierarchy()
        self.configureLayout()
        self.configureView()
    }
    
    override func configureHierarchy() {
        self.addSubview(self.tamagoImage)
        self.addSubview(self.tamagoName)
    }
    
    override func configureLayout() {
        self.tamagoName.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.tamagoImage.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        // TODO: 아래 두 구문의 순서를 바꾸면 결과가 달라짐
        self.tamagoName.snp.makeConstraints { make in
            make.centerX.bottom.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()
        }
        
        self.tamagoImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.tamagoName.snp.top).offset(-4)
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
