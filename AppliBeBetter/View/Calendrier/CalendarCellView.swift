//
//  CalendarCellView.swift
//  CalendarSwiftUI
//
//  Created by Apprenante20 on 22/06/2023.
//

import SwiftUI

struct CalendarCellView: View
{
    @EnvironmentObject var dateHolder: DateHolder
    let count : Int
    let startingSpaces : Int
    let daysInMonth : Int
    let daysInPrevMonth : Int
    
    var body: some View {

        if monthStruct().dayInt == CalendarHelper().daysOfMonth(Date.now) &&
            CalendarHelper().monthYearString(dateHolder.date) == CalendarHelper().monthYearString(Date.now) &&
            monthStruct().monthType == MonthType.Current {
            
            NavigationLink {
                VStack{
                    
                    CalendarWeekManager(calendar: Calendar(identifier: .gregorian), selectedday: buildDateFromDayMonthYear(selectedDay: monthStruct().dayInt, dateHolderGiven: dateHolder.date, monthType: monthStruct().monthType))
                }
            } label: {
                Text(monthStruct().day)
            }
            .foregroundColor(textColor(type: monthStruct().monthType))
            .padding(10)
            .background(Color("bleu"))
            .cornerRadius(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            
        } else {
            NavigationLink {
                VStack{
                    CalendarWeekManager(calendar: Calendar(identifier: .gregorian), selectedday: buildDateFromDayMonthYear(selectedDay: monthStruct().dayInt, dateHolderGiven: dateHolder.date, monthType: monthStruct().monthType))
                }
                
            } label: {
                Text(monthStruct().day)
            }
            .foregroundColor(textColor(type: monthStruct().monthType))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
    
    func textColor(type: MonthType) -> Color
    {
        return type == MonthType.Current ? Color.black : Color.gray
    }
    
    func monthStruct() -> MonthStruct
    {
        let start = startingSpaces == 0 ? startingSpaces + 7 : startingSpaces
        if(count <= start)
        {
           let day = daysInPrevMonth + count - start
            return MonthStruct(monthType: MonthType.Previous, dayInt: day)
        }
        else if (count - start > daysInMonth)
        {
            let day = count - start - daysInMonth
            return MonthStruct(monthType: MonthType.Next, dayInt: day)
        }
        
        
        let day = count - start
        return MonthStruct(monthType: MonthType.Current, dayInt: day)
    }
    
    func buildDateFromDayMonthYear(selectedDay: Int, dateHolderGiven: Date, monthType: MonthType) -> Date
    {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: dateHolderGiven)
        

        dateFormatter.dateFormat = "MM"
        let month = dateFormatter.string(from: dateHolderGiven)
        var tempMonthInt = 0
        
        if (monthType == MonthType.Previous){
            tempMonthInt = Int(month)!
        
            if(tempMonthInt < 1){
                tempMonthInt = 12
            } else {
                tempMonthInt = tempMonthInt - 1
            }
        } else if (monthType == MonthType.Next){
            tempMonthInt = Int(month)!
            
            if (tempMonthInt >= 12) {
                // if december and next month -> return january
                tempMonthInt = 1
            } else {
                tempMonthInt = tempMonthInt + 1
            }
        } else {
            // Nothing to do as the month is the current
            tempMonthInt = Int(month)!
        }
        
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = Int(year)
        dateComponents.month = tempMonthInt
        dateComponents.day = selectedDay
        dateComponents.timeZone = TimeZone(abbreviation: "JST") // Japan Standard Time
        dateComponents.hour = 23
        dateComponents.minute = 59

        // Create date from components
        let userCalendar = Calendar(identifier: .gregorian) // since the components above (like year 1980) are for Gregorian
        guard let someDateTime = userCalendar.date(from: dateComponents) else { return Date() }

        return someDateTime
    }
}


extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

