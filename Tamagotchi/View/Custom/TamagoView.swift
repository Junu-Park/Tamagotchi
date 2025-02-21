//
//  TamagoView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/21/25.
//

import UIKit

import SnapKit

final class TamagoView: UIView, ConfigureProtocol {
    
    let tamagoImage: UIImageView = UIImageView(image: .no)
    let tamagoName: InsetLabel = InsetLabel(inset: 4)
    
    init(image: UIImage = .no, name: String = "준비중이에요") {
        super.init(frame: .zero)
        
        self.tamagoImage.image = image
        self.tamagoName.text = name
        
        self.configureHierarchy()
        self.configureLayout()
        self.configureView()
    }
    
    func configureHierarchy() {
        self.addSubview(self.tamagoImage)
        self.addSubview(self.tamagoName)
    }
    
    func configureLayout() {
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
    
    func configureView() {
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
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
