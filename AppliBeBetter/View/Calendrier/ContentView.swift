//
//  ContentView.swift
//  CalendarSwiftUI
//
//  Created by Apprenante20 on 22/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    @EnvironmentObject var taskModel: TaskViewModel
    
    var body: some View
    {
        NavigationView{
            ZStack{
                VStack(spacing: 1)
                {
                    DateScrollerView()
                        .padding()
                    
                    dayOfWeekStack
                    calendarGrid
                        .overlay(
                        
                            ButtonAddTask(),alignment: .bottomTrailing
                        )
                        .sheet(isPresented: $taskModel.addNewTask) {
                            // Clearing Edit Data
                            taskModel.editTask = nil
                        } content: {
                            NewTask()
                                .environmentObject(taskModel)
                        }
                    
                } //end of VStack
            }
        }
    }

    var dayOfWeekStack: some View
        {
            HStack(spacing: -30)
            {
                ForEach(DateFormatter().shortWeekdaySymbols, id:\.self){ day in
                    Text(day).dayOfWeeck()
                    
                }
                
            } //end of HStack
            .foregroundColor(Color("bleunoir"))
        }
        
    var calendarGrid: some View
        {
            
            VStack(spacing: 1)
            {
                let dayInMonth = CalendarHelper().daysInMonth(dateHolder.date)
                let firstOfMonth = CalendarHelper().firstOfMonth(dateHolder.date)
                let startingSpaces = CalendarHelper().weekDay(firstOfMonth)
                let prevMonth = CalendarHelper().minusMonth(dateHolder.date)
                let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
                ForEach(0..<6) // rows of the grid
                {
                    row in
                    HStack(spacing: -30)
                    {
                        ForEach(1..<8) // 7(days) column per row
                        {
                            column in
                            let count = column + (row * 7)
                            
                            CalendarCellView(count: count, startingSpaces: startingSpaces, daysInMonth: dayInMonth, daysInPrevMonth: daysInPrevMonth)
                                .environmentObject(dateHolder)
                            
                        }
                    }
                }
                Spacer()
            } //end of VStack
            
            .frame(maxHeight: .infinity)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DateHolder())
            .environmentObject(TaskViewModel())
    }
}


extension Text
{
    func dayOfWeeck() -> some View
    //Func for the dayOfWeeck
    {
        self.frame(maxWidth: .infinity)
            .padding(.top, 10)
            .lineLimit(1)
            .fontWeight(.semibold)
    }
}
