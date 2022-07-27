//
//  Memo.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/26.
//

import Foundation

extension Memo {
    func getContentToArray() -> [String] {
        var compactString = self.content
        while let replaceString = compactString.range(of: "\n\n") {
            compactString.replaceSubrange(replaceString, with: "\n")
        }
        return compactString.components(separatedBy: "\n")
    }
    
    func getCellData() -> (title: String, content: String) {
        let stringArray = self.getContentToArray()
        
        var hasTitle = false
        var title = "새로운 메모"
        var content = "추가된 텍스트가 없습니다."
        
        for str in stringArray {
            if str.replacingOccurrences(of: "\n", with: "") != "" {
                if !hasTitle {
                    title = str
                    hasTitle = true
                } else {
                    content = str
                    break
                }
            }
        }
        
        return (title, content)
    }
}
