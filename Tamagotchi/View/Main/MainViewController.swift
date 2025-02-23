//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/23/25.
//

import UIKit

final class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureView() {
        let name = UserDataManager.name.value
        self.navigationItem.title = "\(name)님의 다마고치"
        
        let right = UIBarButtonItem(image: .profile, style: .plain, target: self, action: #selector(self.transitionProfile))
        self.navigationItem.setRightBarButton(right, animated: true)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.titleTextAttributes = [.foregroundColor: UIColor.font]
        self.navigationItem.scrollEdgeAppearance = appearance
    }
    
    // TODO: 화면 전환 로직 추가
    @objc private func transitionProfile() {
        
    }
}
