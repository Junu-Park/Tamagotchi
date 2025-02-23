//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/23/25.
//

import UIKit

final class MainViewController: BaseViewController {
    
    // TODO: MVVM 적용
    private let talkBubbleView: TalkBubbleView = TalkBubbleView(talkText: TalkType.getRandomTalk())
    // TODO: MVVM 적용
    private let tamagoView: TamagoView = TamagoView(tamagoType: UserDataManager.tamago.value)
    private let infoLabel: UILabel = UILabel()
    private let foodBehaviorView: MainBehaviorView = MainBehaviorView(behaviorType: .food)
    private let waterBehaviorView: MainBehaviorView = MainBehaviorView(behaviorType: .water)
    
    // TODO: MVVM 적용
    var tamagoType: TamagoType = UserDataManager.tamago.value
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configureHierarchy() {
        [self.talkBubbleView, self.tamagoView, self.infoLabel, self.foodBehaviorView, self.waterBehaviorView].forEach { view in
            self.view.addSubview(view)
        }
    }
    
    override func configureLayout() {
        self.talkBubbleView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).inset(32)
            make.horizontalEdges.equalToSuperview().inset(80)
            make.height.equalTo(150)
        }
        self.tamagoView.snp.makeConstraints { make in
            make.top.equalTo(self.talkBubbleView.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        self.infoLabel.snp.makeConstraints { make in
            make.top.equalTo(self.tamagoView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        self.foodBehaviorView.snp.makeConstraints { make in
            make.top.equalTo(self.infoLabel.snp.bottom).offset(24)
            make.horizontalEdges.equalToSuperview().inset(80)
            make.height.equalTo(40)
        }
        self.waterBehaviorView.snp.makeConstraints { make in
            make.top.equalTo(self.foodBehaviorView.snp.bottom).offset(8)
            make.horizontalEdges.equalToSuperview().inset(80)
            make.height.equalTo(40)
        }
    }
    
    override func configureView() {
        self.navigationItem.backButtonDisplayMode = .minimal
        
        let name = UserDataManager.name.value
        self.navigationItem.title = "\(name)님의 다마고치"
        
        let right = UIBarButtonItem(image: .profile, style: .plain, target: self, action: #selector(self.transitionProfile))
        self.navigationItem.setRightBarButton(right, animated: true)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.titleTextAttributes = [.foregroundColor: UIColor.font]
        self.navigationItem.scrollEdgeAppearance = appearance
        
        self.infoLabel.text = self.getInfoString()
        self.infoLabel.font = .systemBold14
        self.infoLabel.textAlignment = .center
    }
    
    @objc private func transitionProfile() {
        self.navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
    // TODO: MVVM 패턴 적용
    private func getInfoString() -> String {
        let level = UserDataManager.level
        let food = UserDataManager.food.value
        let water = UserDataManager.water.value
        
        return "LV\(level) • 밥알 \(food)개 • 물방울 \(water)개"
    }
}
