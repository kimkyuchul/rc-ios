//
//  UseDefaultInfo.swift
//  Social Login
//
//  Created by qualson1 on 2022/08/27.
//

import Foundation

class UserDefaultInfo {
    
    static func getUserDefault(_ loginType: LoginType) {
        let userdefault = UserDefaults.standard
        userdefault.set(loginType.rawValue, forKey: "LoginType")
    }
    
    static func resetUserDefault() {
        let userdefault = UserDefaults.standard
        userdefault.set(LoginType.None.rawValue, forKey: "LoginType")
    }
}
