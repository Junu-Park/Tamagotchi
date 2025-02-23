//
//  UserDataManager.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/23/25.
//

import Foundation

// TODO: @propertyWrapper 적용하기
struct UserDefaultManager<T: Codable> {
    let key: String
    let defaultValue: T
    
    var value: T {
        set {
            do {
                let encoder = JSONEncoder()
                
                let encodedData = try encoder.encode(newValue)
                
                UserDefaults.standard.set(encodedData, forKey: self.key)
            } catch {
                // TODO: 에러 처리
            }
        }
        get {
            guard let data = UserDefaults.standard.data(forKey: self.key), data.count > 0 else {
                return self.defaultValue
            }
            do {
                let decoder = JSONDecoder()
                
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                // TODO: 에러 처리
                return self.defaultValue
            }
        }
    }
    
    static func reset(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

enum UserDataManager {
    enum Key: String, CaseIterable {
        case isOnboarding
        case tamago
        case name
        case water
        case food
    }
    
    static var isOnboarding = UserDefaultManager(key: Key.isOnboarding.rawValue, defaultValue: true)
    static var tamago = UserDefaultManager(key: Key.tamago.rawValue, defaultValue: TamagoType.none)
    static var name = UserDefaultManager(key: Key.name.rawValue, defaultValue: "대장")
    static var water = UserDefaultManager(key: Key.water.rawValue, defaultValue: 0)
    static var food = UserDefaultManager(key: Key.food.rawValue, defaultValue: 0)
    static var level: Int {
        let water = self.water.value
        let food = self.food.value
        let exp = (food / 5) + (water / 2)
        switch exp {
        case 10..<100:
            return exp / 10
        case 100...:
            return 10
        default:
            return 1
        }
    }
    
    static func resetData() {
        Key.allCases.forEach { key in
            UserDefaultManager<String>.reset(key: key.rawValue)
        }
    }
}
