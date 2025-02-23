//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 박준우 on 2/24/25.
//

import UIKit

enum SettingTableViewCellType: CaseIterable {
    case name
    case tamago
    case reset
    
    var image: UIImage {
        switch self {
        case .name:
            return .setName
        case .tamago:
            return .changeTamago
        case .reset:
            return .resetData
        }
    }
    
    var title: String {
        switch self {
        case .name:
            return "내 이름 설정하기"
        case .tamago:
            return "다마고치 변경하기"
        case .reset:
            return "데이터 초기화"
        }
    }
    
    var detail: String {
        switch self {
        case .name:
            return UserDataManager.name.value
        default:
            return ""
        }
    }
}

final class SettingTableViewCell: UITableViewCell {
    static let id: String = "SettingTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.tintColor = .font
        self.textLabel?.textColor = .font
        self.textLabel?.font = .systemBold13
        self.detailTextLabel?.font = .system13
        self.accessoryType = .disclosureIndicator
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
