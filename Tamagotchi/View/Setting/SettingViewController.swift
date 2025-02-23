//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/24/25.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

final class SettingViewController: BaseViewController {
    
    private let tableView: UITableView = UITableView()
    
    private var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureHierarchy() {
        self.view.addSubview(self.tableView)
    }
    
    override func configureLayout() {
        self.tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.titleTextAttributes = [.foregroundColor: UIColor.font]
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.title = "설정"
        
        self.tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.id)
        self.tableView.backgroundColor = .clear
        self.tableView.separatorInset.left = 0
        self.tableView.isScrollEnabled = false
        
        Observable.just(SettingTableViewCellType.allCases)
            .bind(to: self.tableView.rx.items(cellIdentifier: SettingTableViewCell.id, cellType: SettingTableViewCell.self))({ index, data, cell in
                cell.imageView?.image = data.image
                cell.textLabel?.text = data.title
                cell.detailTextLabel?.text = data.detail
            })
            .disposed(by: self.disposeBag)
    }
}
