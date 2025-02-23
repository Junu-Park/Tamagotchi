//
//  MainBehaviorView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/24/25.
//

import UIKit

import SnapKit

final class MainBehaviorView: BaseView {
    
    enum BehaviorType {
        case food
        case water
        
        var placeholder: String {
            switch self {
            case .food:
                return "밥주세용"
            case .water:
                return "물주세용"
            }
        }
        
        var buttonImage: UIImage {
            switch self {
            case .food:
                return .eatFood
            case .water:
                return .drinkWater
            }
        }
        
        var buttonText: String {
            switch self {
            case .food:
                return "밥먹기"
            case .water:
                return "물먹기"
            }
        }
    }

    let textField: UITextField = UITextField()
    private let underline: UIView = UIView()
    let button: UIButton = UIButton()
    
    var behaviorType: BehaviorType
    
    init(behaviorType: BehaviorType) {
        self.behaviorType = behaviorType
        super.init()
    }
    
    override func configureHierarchy() {
        [self.textField, self.underline, self.button].forEach { view in
            self.addSubview(view)
        }
    }
    
    override func configureLayout() {
        self.textField.snp.makeConstraints { make in
            make.verticalEdges.leading.equalToSuperview()
        }
        self.underline.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(self.textField)
            make.height.equalTo(1)
        }
        self.button.snp.makeConstraints { make in
            make.leading.equalTo(self.textField.snp.trailing).offset(8)
            make.verticalEdges.trailing.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.4)
        }
    }
    
    override func configureView() {
        self.textField.attributedPlaceholder = NSAttributedString(string: self.behaviorType.placeholder, attributes: [.font: UIFont.systemBold14, .foregroundColor: UIColor.lightGray])
        self.textField.font = .systemBold14
        self.textField.textAlignment = .center
        self.textField.tintColor = .font
        self.textField.textColor = .font
        
        self.underline.backgroundColor = .border
        
        self.button.setAttributedTitle(NSAttributedString(string: self.behaviorType.buttonText, attributes: [.font: UIFont.systemBold14]), for: [])
        self.button.setImage(self.behaviorType.buttonImage, for: [])
        self.button.tintColor = .border
        self.button.configuration = UIButton.Configuration.plain()
        self.button.configuration?.imagePadding = 4
        self.button.layer.cornerRadius = 10
        self.button.layer.borderColor = UIColor.border.cgColor
        self.button.layer.borderWidth = 1
    }
}
