//
//  SettingSection.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/08/04.
//

//https://velog.io/@din0121/Swift-Table-View-Multi-Section


import Foundation
import UIKit

enum CellType: String {
    case detailTitle
    case rightDetail
}

struct SettingItem {
    let title: String?
    let iconImage: UIImage?
    let type: CellType
}

struct SettingSection {
    let items: [SettingItem]
    
    func generateData() -> [SettingSection] {
        
        return [
            SettingSection(items: [SettingItem(title: "", iconImage: <#T##UIImage?#>, type: <#T##CellType#>)])
        ]
        
    }
    
}
