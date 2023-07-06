//
//  DateScrollerView.swift
//  CalendarSwiftUI
//
//  Created by Apprenante20 on 22/06/2023.
//

import SwiftUI

struct DateScrollerView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    //Colling in ContentView
    
    var body: some View {
        
        HStack
        {
            Spacer()
            Button(action: previousMonth)
            {
                Image(systemName: "chevron.left")
                    .imageScale(.medium)
                    .font(Font.title.weight(.semibold))
                    .foregroundColor(Color("bleufonce"))
                    
                
            }
            
            Text(CalendarHelper().monthYearString(dateHolder.date))
                .font(.system(size: 25))
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color("bleunoir"))
            
            Button(action: nextMonth)
            {
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .font(Font.title.weight(.semibold))
                    .foregroundColor(Color("bleufonce"))
                
            }
            Spacer()
            
        }
    }
    
    func previousMonth()
    {
        dateHolder.date = CalendarHelper().minusMonth(dateHolder.date)
    }
    
    func nextMonth()
    {
        dateHolder.date = CalendarHelper().plusMonth(dateHolder.date)
    }
    
}

