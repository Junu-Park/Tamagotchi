//
//  BaseView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/22/25.
//

import UIKit

class BaseView: UIView, ConfigureProtocol {
    
    init() {
        super.init(frame: .zero)
        
        self.configureHierarchy()
        self.configureLayout()
        self.configureView()
    }
    
    func configureHierarchy() { }
    
    func configureLayout() { }
    
    func configureView() { }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
