//
//  TaskViewModel.swift
//  TaskManagement (iOS)
//
//  Created by Apprenante20 on 08/01/22.
//

import SwiftUI

class TaskViewModel: ObservableObject{
    
    // Current Week Days
    @Published var currentWeek: [Date] = []
    
    // Current Day
    @Published var currentDay: Date = Date()
    
    // Filtering Today Tasks
    @Published var filteredTasks: [TaskEntity]?
    
    // New Task View
    @Published var addNewTask: Bool = false
    
    // Edit Data
    @Published var editTask: TaskEntity?
    
    // Intializing
    init(){
        fetchCurrentWeek()
    }
    
    func fetchCurrentWeek(){
        
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else{
            return
        }
        
        (0..<7).forEach { day in
            
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay){
                currentWeek.append(weekday)
            }
        }
    }
    
    // Extracting Date
    func extractDate(date: Date,format: String)->String{
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    // Checking if current Date is Today
    func isToday(date: Date)->Bool{
        
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    // Checking if the currentHour is task Hour
    func isCurrentHour(date: Date)->Bool{
        
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let currentHour = calendar.component(.hour, from: Date())
        
        let isToday = calendar.isDateInToday(date)
        
        return (hour == currentHour && isToday)
    }
}
