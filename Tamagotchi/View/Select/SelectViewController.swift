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
    
    override func bind() {
        Observable.just(Mock.tamagoList)
            .bind(to: self.collectionView.rx.items(cellIdentifier: SelectCollectionViewCell.id, cellType: SelectCollectionViewCell.self)) { item, data, cell in
                cell.tamagoView.tamagoType = data
            }
            .disposed(by: self.disposeBag)
        
        // TODO: Alert 띄우기 기능
        self.collectionView.rx.modelSelected(TamagoType.self)
            .bind { value in
                print(value)
            }
            .disposed(by: self.disposeBag)
    }
}
