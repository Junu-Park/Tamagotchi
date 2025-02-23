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
    
    deinit {
        print(self)
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
        
        self.tableView.rx.modelSelected(SettingTableViewCellType.self)
            .bind(with: self) { owner, value in
                if value == .name {
                    owner.navigationController?.pushViewController(SetNameViewController(), animated: true)
                } else if value == .tamago {
                    owner.navigationController?.pushViewController(SelectViewController(), animated: true)
                } else if value == .reset {
                    owner.resetAlert()
                }
            }
            .disposed(by: self.disposeBag)
    }
}

extension SettingViewController {
    func resetAlert() {
        let ac = UIAlertController(title: "데이터 초기화", message: "정말 처음부터 시작하실건가용?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "아냐!", style: .cancel)
        let confirm = UIAlertAction(title: "웅", style: .default) { _ in
            UserDataManager.resetData()
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else { return }
            let vc = SelectViewController()
            window.rootViewController = UINavigationController(rootViewController: vc)
            window.makeKeyAndVisible()
        }
        ac.addAction(cancel)
        ac.addAction(confirm)
        
        self.present(ac, animated: true)
    }
}
