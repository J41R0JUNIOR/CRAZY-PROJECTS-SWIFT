//
//  Date+Extension.swift
//  Plus Time
//
//  Created by Jairo Júnior on 20/05/23.
//

import Foundation

extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding:.day,value:numDays,to:self)!
    }
    
    var startOfDay: Date{
        Calendar.current.startOfDay(for: self)
    }
}
