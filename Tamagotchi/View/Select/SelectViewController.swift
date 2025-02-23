//
//  SelectViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

final class SelectViewController: BaseViewController {
    
    private let collectionView: SelectCollectionView = SelectCollectionView()
    
    private var disposeBag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print(self)
    }
    
    override func configureHierarchy() {
        self.view.addSubview(self.collectionView)
    }
    
    override func configureLayout() {
        self.collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        if UserDataManager.isOnboarding.value {
            self.navigationItem.title = "다마고치 선택하기"
        } else {
            self.navigationItem.title = "다마고치 변경하기"
        }
    }
    
    override func bind() {
        Observable.just(Mock.tamagoList)
            .bind(to: self.collectionView.rx.items(cellIdentifier: SelectCollectionViewCell.id, cellType: SelectCollectionViewCell.self)) { item, data, cell in
                cell.tamagoView.tamagoType = data
            }
            .disposed(by: self.disposeBag)
        
        self.collectionView.rx.modelSelected(TamagoType.self)
            .bind(with: self, onNext: { owner, value in
                if value != .none {
                    let vc = SelectAlertViewController(tamagoType: value)
                    vc.closure = {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    // TODO: overCurrentContext vs overFullScreen
                    vc.modalPresentationStyle = .overCurrentContext
                    owner.present(vc, animated: false)
                }
            })
            .disposed(by: self.disposeBag)
    }
}
