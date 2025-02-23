//
//  SelectAlertView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/22/25.
//

import UIKit

import SnapKit

final class SelectAlertView: BaseView {
    
    private lazy var tamagoView: TamagoView = TamagoView(tamagoType: self.tamagoType)
    private let seperator: UIView = UIView()
    private let tamagoDescription: UILabel = UILabel()
    private lazy var buttonStackView: UIStackView = UIStackView(arrangedSubviews: [self.cancelButton, self.startButton])
    let cancelButton: UIButton = UIButton()
    let startButton: UIButton = UIButton()
    
    private var tamagoType: TamagoType
    
    init(tamagoType: TamagoType) {
        self.tamagoType = tamagoType
        super.init()
    }
    
    override func configureHierarchy() {
        [self.tamagoView, self.seperator, self.tamagoDescription, self.buttonStackView].forEach { view in
            self.addSubview(view)
        }
    }
    override func configureLayout() {
        self.tamagoView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
        self.seperator.snp.makeConstraints { make in
            make.top.equalTo(self.tamagoView.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(48)
            make.height.equalTo(1)
        }
        self.tamagoDescription.snp.makeConstraints { make in
            make.top.equalTo(self.seperator.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(48)
        }
        self.buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(self.tamagoDescription.snp.bottom).offset(32)
            make.height.equalTo(50)
            make.horizontalEdges.bottom.equalToSuperview().inset(-1)
        }
    }
    override func configureView() {
        self.seperator.backgroundColor = .border
        
        self.tamagoDescription.numberOfLines = 0
        self.tamagoDescription.textAlignment = .center
        self.tamagoDescription.font = .system14
        self.tamagoDescription.text = self.tamagoType.description
        
        self.buttonStackView.axis = .horizontal
        self.buttonStackView.distribution = .fillEqually
        self.buttonStackView.layer.borderWidth = 1
        self.buttonStackView.layer.borderColor = UIColor.gray.cgColor
        
        self.cancelButton.setTitle("취소", for: [])
        self.cancelButton.backgroundColor = .lightGray.withAlphaComponent(0.2)
        
        self.startButton.setTitle("시작하기", for: [])
    }
}
