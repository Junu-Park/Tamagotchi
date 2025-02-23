//
//  ViewModelProtocol.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/24/25.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
