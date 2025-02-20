//
//  BaseViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

protocol ConfigureProtocol {
    func configureView()
    func configureHierarchy()
    func configureLayout()
}

class BaseViewController: UIViewController, ConfigureProtocol {

    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.navigationItem.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .background
        
        self.configureView()
        self.configureHierarchy()
        self.configureLayout()
        self.bind()
    }
    
    func configureView() { }
    func configureHierarchy() { }
    func configureLayout() { }
    func bind() { }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
