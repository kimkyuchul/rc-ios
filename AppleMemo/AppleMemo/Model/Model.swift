//
//  Model.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/19.
//

import Foundation
import RealmSwift


class Memo: Object {
    
//    @Persisted var title: String
    @Persisted var content: String
    @Persisted var createdDate: Date
    @Persisted var updatedDate: Date
    @Persisted var deletedDate: Date?
    
    
    
    @Persisted(primaryKey: true) var _id: ObjectId // primaryKey
    
    
    convenience init(content: String, createdDate: Date, updatedDate: Date, deletedDate: Date?) {
        self.init()
        
//        self.title = title
        self.content = content
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.deletedDate = deletedDate
    }
}
    

