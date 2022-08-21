//
//  Date.swift
//  AppleMemo
//
//  Created by qualson1 on 2022/07/27.
//

import Foundation


extension DateFormatter {
    
    
    static var todayFormatter: DateFormatter {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "a HH:mm" // 16:30
        return dateFormatter
    }
    
    static var thisWeekFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "EEEE" // 이번주
        return dateFormatter
    }
    
    static var noneFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" 
        return dateFormatter
    }
    
    
    static func dateFommatterUse(date: Date) -> String {
        let calendar: Calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            let formatter = todayFormatter
            return formatter.string(from: date)
        }
        
        else if calendar.isDateInYesterday(date) {
            return "어제"
        }
        
        else if calendar.isDateInWeekend(date) {
            let formatter = thisWeekFormatter
            return formatter.string(from: date)
        }
        
        let formatter = noneFormatter
        return formatter.string(from: date)
        
    }
    
    
    
    
    
    
    
    
}
