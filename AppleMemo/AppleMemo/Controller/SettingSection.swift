//
//  SettingSection.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/08/04.
//

import Foundation
import UIKit

enum SettingSection {
    case option1([optionOne])
    case option2([optionTwo])
}

struct optionOne {
    let title: String?
    let iconImage: UIImage?
}

struct optionTwo {
    let title: String?
    let iconImage: UIImage?
}
