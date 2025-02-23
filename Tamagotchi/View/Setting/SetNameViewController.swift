//
//  SetNameViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/24/25.
//

import UIKit

import SnapKit

final class SetNameViewController: BaseViewController {

    private let textField: UITextField = UITextField()
    private let underline: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print(self)
    }
    
    override func configureHierarchy() {
        [self.textField, self.underline].forEach { view in
            self.view.addSubview(view)
        }
    }
    
    override func configureLayout() {
        self.textField.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            make.horizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(44)
        }
        self.underline.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(self.textField)
            make.height.equalTo(1)
        }
    }
    
    override func configureView() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.titleTextAttributes = [.foregroundColor: UIColor.font]
        self.navigationItem.scrollEdgeAppearance = appearance
        
        let name = UserDataManager.name.value
        self.navigationItem.title = "\(name)님 이름 정하기"
        
        let right = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(self.saveName))
        self.navigationItem.setRightBarButton(right, animated: true)
        
        self.textField.text = UserDataManager.name.value
        self.textField.attributedPlaceholder = NSAttributedString(string: UserDataManager.name.value, attributes: [.font: UIFont.systemBold14, .foregroundColor: UIColor.lightGray])
        self.textField.font = .systemBold14
        self.textField.tintColor = .font
        self.textField.textColor = .font
        
        self.underline.backgroundColor = .border
    }
    
    // TODO: MVVM 적용
    @objc private func saveName() {
        UserDataManager.name.value = self.textField.text ?? UserDataManager.name.value
        self.navigationController?.popViewController(animated: true)
    }
}
