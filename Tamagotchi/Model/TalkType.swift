//
//  TalkType.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/23/25.
//

import Foundation

enum TalkType: CaseIterable {
    case food
    case water
    case hello
    case levelUp
    
    var text: String {
        switch self {
        case .food:
            return "\(UserDataManager.name.value)님 밥주세요"
        case .water:
            return "\(UserDataManager.name.value)님 물주세요"
        case .hello:
            return "좋은하루에요, \(UserDataManager.name.value)님"
        case .levelUp:
            return "밥과 물을 잘먹었더니 레벨업 했어요. 고마워요 \(UserDataManager.name.value)님"
        }
    }

    static func getRandomTalk(isLevelUp: Bool = false) -> String {
        if isLevelUp {
            return TalkType.levelUp.text
        } else {
            return [TalkType.food, TalkType.hello, TalkType.water].randomElement()?.text ?? TalkType.hello.text
        }
    }
}
