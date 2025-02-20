//
//  InsetLabel.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

final class InsetLabel: UILabel {
    
    private let inset: CGFloat
    
    init(inset: CGFloat) {
        self.inset = inset
        super.init(frame: .zero)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: self.inset, left: self.inset, bottom: self.inset, right: self.inset)))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        
        contentSize.height += self.inset * 2
        contentSize.width += self.inset * 2
        
        return contentSize
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
