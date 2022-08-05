//
//  SettingSection.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/08/04.
//

//https://velog.io/@din0121/Swift-Table-View-Multi-Section


import Foundation
import UIKit

//섹션 타입
enum CellType: String {
    case detailTitle
    case rightDetail
}

// 셀 구성 요소
 struct SettingItem {
    let title: String?
    let iconImage: UIImage?
    let type: CellType
}


 struct SettingSection {
    let items: [SettingItem]
    
// If you need to use the method without an instance, you need to declare the method as static
    static func generateData() -> [SettingSection] {
        
    return [
    SettingSection(items: [
    SettingItem(title: "갤러리로 보기", iconImage: UIImage(systemName: "pencil"), type: .detailTitle),
    SettingItem(title: "정보", iconImage: UIImage(systemName: "pencil"), type: .detailTitle)]),
    SettingSection(items: [
    SettingItem(title: "메모 선택", iconImage: UIImage(systemName: "pencil"), type: .rightDetail),
    SettingItem(title: "기본값 순서로 메모 정렬", iconImage: UIImage(systemName: "pencil"), type: .rightDetail),
    SettingItem(title: "첨부 파일 보기", iconImage: UIImage(systemName: "pencil"), type: .rightDetail)])
        ]
    }
    
}
