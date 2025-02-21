//
//  TamagoType.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/21/25.
//

import Foundation

enum TamagoType {
    case tingling(level: Int = 1)
    case smiling(level: Int = 1)
    case twinkling(level: Int = 1)
    case none
    
    var name: String {
        switch self {
        case .tingling:
            return "따끔따끔 다마고치"
        case .smiling:
            return "방실방실 다마고치"
        case .twinkling:
            return "반짝반짝 다마고치"
        case .none:
            return "준비중이에요"
        }
    }
    
    var imageString: String {
        switch self {
        case .tingling(let level):
            return "1-\(level)"
        case .smiling(let level):
            return "2-\(level)"
        case .twinkling(let level):
            return "3-\(level)"
        case .none:
            return "noImage"
        }
    }
}
