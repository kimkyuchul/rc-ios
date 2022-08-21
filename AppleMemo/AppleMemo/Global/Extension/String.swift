//
//  String.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/24.
//

import Foundation

extension String {
    var pasringConntectText: [String] {
        
        // array는 스트링 문자열?
        var array = self.components(separatedBy: "\n")
        if array.count < 2 {
            return array
        }
        
        var memoArray: [String] = []
        memoArray.append(array[0])
        array.remove(at: 0)


        
        var contentString = ""
        array.forEach {
            contentString += ($0 + "\n")
        }
        
        memoArray.append(contentString)
        return memoArray
    }
}
