//
//  Model.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/19.
//

import Foundation
import RealmSwift


class Memo: Object {
    
    @Persisted var title: String
    @Persisted var content: String
    
    @Persisted(primaryKey: true) var _id: ObjectId // primaryKey
    
    convenience init(title: String, content: String) {
        self.init()
        
        self.title = title
        self.content = content
    }
}
    

