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
    
    deinit {
        print(self)
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
    
    override func bind() {
        // TODO: MVVM 적용 고민해보기
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissView))
        tap.delegate = self
//        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        // TODO: MVVM 적용 고민해보기
        self.selectAlertView.cancelButton.addTarget(self, action: #selector(self.dismissView), for: .touchUpInside)
        
        //TODO: MVVM 적용하기
        self.selectAlertView.startButton.addTarget(self, action: #selector(self.transitionMainView), for: .touchUpInside)
    }
    
    @objc private func dismissView() {
        self.dismiss(animated: false)
    }
    
    // TODO: SelectViewController deinit 호출 안 되는 오류
    @objc private func transitionMainView() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let window = windowScene.windows.first else { return }
        // TODO: 실 데이터 적용
        let vc = MainViewController(title: "\("대장")님의 다마고치")
        window.rootViewController = UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
    }
}

extension SelectAlertViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view == self.view {
            return true
        } else {
            return false
        }
    }
}
