//
//  TamagoType.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/21/25.
//

import Foundation

enum TamagoType: Codable {
    case tingling
    case smiling
    case twinkling
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
    
    func getImageString(isSelectView: Bool = false) -> String {
        var level = isSelectView ? 6 : UserDataManager.level
        if level == 10 {
            level = 9
        }
        
        switch self {
        case .tingling:
            return "1-\(level)"
        case .smiling:
            return "2-\(level)"
        case .twinkling:
            return "3-\(level)"
        case .none:
            return "noImage"
        }
    }
    
    var description: String {
        switch self {
        case .tingling:
            return
"""
저는 따끔따끔 다마고치입니다.
Github에 잔디를 매일 안 박으시면
인생이 따끔하실 겁니다.
"""
        case .smiling:
            return
"""
저는 방긋방긋 다마고치입니다.
Github에 잔디를 매일 박으셔야
웃으실 자격이 있습니다.
"""
        case .twinkling:
            return
"""
저는 반짝반짝 다마고치입니다.
Github에 잔디를 매일 박으시면
반짝반짝 빛날거예요
"""
        case .none:
            return "준비중이에요"
        }
    }
}
