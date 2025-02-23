//
//  Mock.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/21/25.
//

import Foundation

struct Mock {
    static var tamagoList: [TamagoType] = [
        TamagoType.tingling,
        TamagoType.smiling,
        TamagoType.twinkling,
    ] + Array(repeating: TamagoType.none, count: 20)
}
