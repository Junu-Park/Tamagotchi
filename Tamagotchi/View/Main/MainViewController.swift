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
    }
}
