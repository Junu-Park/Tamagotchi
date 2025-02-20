//
//  BaseViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .background
        
        self.configureView()
        self.configureHierarchy()
        self.configureHierarchy()
        self.bind()
    }
    
    func configureView() { }
    func configureHierarchy() { }
    func configureLayout() { }
    func bind() { }
}
