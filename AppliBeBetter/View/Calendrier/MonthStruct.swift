//
//  MonthStruct.swift
//  CalendarSwiftUI
//
//  Created by Apprenante20 on 22/06/2023.
//

import Foundation


struct MonthStruct
{
    var monthType: MonthType
    var dayInt: Int
    var day: String
    {
        return String(dayInt)
    }
}

enum MonthType
{
    case Previous
    case Current
    case Next
    
    
}
