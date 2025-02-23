//
//  SelectAlertViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/21/25.
//

import UIKit

import SnapKit

final class SelectAlertViewController: BaseViewController {
    
    private lazy var selectAlertView: SelectAlertView = SelectAlertView(tamagoType: self.tamagoType)
    
    private var tamagoType: TamagoType
    
    init(tamagoType: TamagoType) {
        self.tamagoType = tamagoType
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureHierarchy()
        self.configureLayout()
        self.configureView()
        self.bind()
    }
    
    override func configureHierarchy() {
        self.view.addSubview(self.selectAlertView)
    }
    
    override func configureLayout() {
        self.selectAlertView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width - 64)
        }
    }
    
    override func configureView() {
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        
        self.selectAlertView.clipsToBounds = true
        self.selectAlertView.backgroundColor = .background
        self.selectAlertView.layer.cornerRadius = 10
    }
}
