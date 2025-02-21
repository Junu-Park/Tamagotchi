//
//  Mock.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/21/25.
//

import Foundation

struct Mock {
    static var tamagoList: [TamagoType] = [
        TamagoType.tingling(level: 6),
        TamagoType.smiling(level: 6),
        TamagoType.twinkling(level: 6),
    ] + Array(repeating: TamagoType.none, count: 20)
}
