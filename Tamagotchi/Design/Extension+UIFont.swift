//
//  extension+UIFont.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/20/25.
//

import UIKit

extension UIFont {
    static var system13: UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    static var system14: UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    static var system15: UIFont {
        return UIFont.systemFont(ofSize: 15)
    }
    
    static var systemBold13: UIFont {
        return UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    static var systemBold14: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    static var systemBold15: UIFont {
        return UIFont.systemFont(ofSize: 15, weight: .bold)
    }
}
