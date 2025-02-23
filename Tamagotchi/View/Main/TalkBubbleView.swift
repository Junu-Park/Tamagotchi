//
//  TalkBubbleView.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/23/25.
//

import UIKit

import SnapKit

final class TalkBubbleView: BaseView {
    private let bubbleImage: UIImageView = UIImageView(image: .bubble)
    let talkLabel: UILabel = UILabel()
    
    init(talkText: String) {
        super.init()
        self.talkLabel.text = talkText
    }
    
    override func configureHierarchy() {
        [self.bubbleImage, self.talkLabel].forEach { view in
            self.addSubview(view)
        }
    }
    
    override func configureLayout() {
        self.bubbleImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.talkLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    override func configureView() {
        self.talkLabel.textAlignment = .center
        self.talkLabel.numberOfLines = 0
        self.talkLabel.font = .systemBold14
    }
}
