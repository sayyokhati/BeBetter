//
//  CalendarWeekManager.swift
//  TaskManager
//
//  Created by Apprenante20 on 2022/01/10.
//

import SwiftUI

struct CalendarWeekManager: View {
    @State private var isButtonClicked = false
    //Core Data Context
    @Environment(\.managedObjectContext) var context
    //Edit Button Context
    @Environment(\.editMode) var editButton
    
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation
    
    private let calendar: Calendar
    private let monthDayFormatter: DateFormatter
    private let dayFormatter: DateFormatter
    private let weekDayFormatter: DateFormatter
    private let timeFormatter: DateFormatter
    
    
    @State private var selectedDate : Date
    private static var now = Date() // Cache now
    
    init(calendar: Calendar, selectedday: Date) {
        self.calendar = calendar
        self._selectedDate = State (wrappedValue: selectedday)
        self.monthDayFormatter = DateFormatter(dateFormat: "MM/dd", calendar: calendar)
        self.dayFormatter = DateFormatter(dateFormat: "d", calendar: calendar)
        self.weekDayFormatter = DateFormatter(dateFormat: "EEE", calendar: calendar)
        self.timeFormatter = DateFormatter(dateFormat: "H:mm", calendar: calendar)
    }
    
    var body: some View {
        ZStack{
            VStack {
                ScrollView() {

                    CalendarWeekListView(
                        calendar: calendar,
                        date: $selectedDate,
                        content: { date in
                            Button(action: {
                                selectedDate = date
                                
                                withAnimation {
                                    taskModel.currentDay = date
                                }
                            }) {
                                VStack(spacing: 10) {
                                    Text(weekDayFormatter.string(from: date))
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        
                                    
                                    Text(dayFormatter.string(from: date))
                                        .font(.system(size: 16))
                                        
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(calendar.isDate(date, inSameDayAs: selectedDate) ? 1 : 0)
                                    
                                }
                                .foregroundStyle(calendar.isDate(date, inSameDayAs: selectedDate) ? .primary : .secondary)
                                .foregroundColor(calendar.isDate(date, inSameDayAs: selectedDate) ? .white : .black)
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack {
                                        if calendar.isDate(date, inSameDayAs: selectedDate) {
                                            Capsule()
                                                .fill(Color("bleufonce"))
                                        }
                                    }
                                )
                            }
                        },
                        title: { date in
                            
                        }, weekSwitcher: { date in
                            HStack{
                            Button {
                                withAnimation(.easeIn) {
                                    guard let newDate = calendar.date(
                                        byAdding: .weekOfMonth,
                                        value: -1,
                                        to: selectedDate
                                    ) else {
                                        return
                                    }
                                    
                                    selectedDate = newDate
                                    taskModel.currentDay = newDate
                                }
                            } label: {
                                Label(
                                    title: { Text("Previous") },
                                    icon: { Image(systemName: "chevron.left") }
                                )
                                .labelStyle(IconOnlyLabelStyle())
                                .padding(.horizontal)
                                .font(Font.title.weight(.semibold))
                                .foregroundColor(Color("bleufonce"))
                            }
                            Text(buildMonthYearTextFromSelectedDate())
                                .font(.system(size: 25))
                                .bold()
                                .animation(.none)
                                .frame(width: 140)
                                .foregroundColor(Color("bleunoir"))
                                                          
                            Button {
                                withAnimation(.easeIn) {
                                    guard let newDate = calendar.date(
                                        byAdding: .weekOfMonth,
                                        value: 1,
                                        to: selectedDate
                                    ) else {
                                        return
                                    }
                                    
                                    selectedDate = newDate
                                    taskModel.currentDay = newDate
                                }
                            } label: {
                                Label(
                                    title: { Text("Next") },
                                    icon: { Image(systemName: "chevron.right") }
                                )
                                .labelStyle(IconOnlyLabelStyle())
                                .padding(.horizontal)
                                .font(Font.title.weight(.semibold))
                                .foregroundColor(Color("bleufonce"))
                            }
                                
                        }
                            .padding(.bottom)
                        }
                    )
                    ZStack{
                        TasksView()
                        
                    }
                    
                }
                .onAppear{
                    taskModel.currentDay = selectedDate
                }
                // Add Button
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
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    // Tasks View
    @ViewBuilder
    func TasksView()->some View{
        
        LazyVStack(spacing: 20){
            
            // Converting object as Our Task Model
            DynamicFilteredView(dateToFilter: taskModel.currentDay) { (object: TaskEntity) in
                
                TaskCardView(task: object)
            }
        }
        .padding()
        .padding(.top)
    }
    
    // Tasks View
    @ViewBuilder
    func TasksView(currentDate: Date)->some View{
        
        LazyVStack(spacing: 20){
            
            // Converting object as Our Task Model
            DynamicFilteredView(dateToFilter: currentDate) { (object: TaskEntity) in
                
                TaskCardView(task: object)
            }
        }
        .padding()
        .padding(.top)
    }
    
    // Task Card View
    @ViewBuilder
    func TaskCardView(task: TaskEntity)->some View{
        
        // Since CoreData Values will Give Optinal data
        HStack(alignment: .center, spacing: 30){
            
            // If Edit mode enabled then showing Delete Button
            if editButton?.wrappedValue == .active{
                
                // Edit Button for Current and Future Tasks
                VStack(spacing: 10){
                    
                    if task.taskDate?.compare(Date()) == .orderedDescending || Calendar.current.isDateInToday(task.taskDate ?? Date()){
                        
                        Button {
                            taskModel.editTask = task
                            taskModel.addNewTask.toggle()
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                                .font(.title)
                                .padding()
                                .foregroundColor(.primary)
                        }
                    }
                    
                    Button {
                        // Deleting Task
                        context.delete(task)
                        
                        // Saving
                        try? context.save()
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
            }
            else{
                
                Button(action: {
                    task.isCompleted.toggle()
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.square.fill":"square")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(Color("bleu"))

                        }
            }
            
            VStack{
                
                HStack(alignment: .top, spacing: 10) {
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(task.taskTitle ?? "")
                            .font(.title2.bold())
                        
                        Text(task.taskDescription ?? "")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Text(task.taskDate?.formatted(date: .omitted, time: .shortened) ?? "")
                    
                    }
                              
                }
            
            }
            .foregroundColor(.black)
            .padding(15)
            .padding(.bottom,0)
            .background(
                RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .foregroundColor(Color("bleu"))
            )

    }
    
    func buildMonthYearTextFromSelectedDate() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: selectedDate)
    }
}
    
    
// - Component

public struct CalendarWeekListView<Day: View, Title: View, WeekSwiter: View>: View {
    // Injected dependencies
    private var calendar: Calendar
    @Binding private var date: Date
    private let content: (Date) -> Day
    private let title: (Date) -> Title
    private let weekSwitcher: (Date) -> WeekSwiter
    
    // Constants
    private let daysInWeek = 7
    
    public init(
        calendar: Calendar,
        date: Binding<Date>,
        @ViewBuilder content: @escaping (Date) -> Day,
        @ViewBuilder title: @escaping (Date) -> Title,
        @ViewBuilder weekSwitcher: @escaping (Date) -> WeekSwiter
    ) {
        self.calendar = calendar
        self._date = date
        self.content = content
        self.title = title
        self.weekSwitcher = weekSwitcher
    }
    
    public var body: some View {
        let month = date.startOfMonth(using: calendar)
        let days = makeDays()
        
        VStack {
            HStack {
                self.title(month)
                self.weekSwitcher(month)
            }
            HStack {
                ForEach(days, id: \.self) { date in
                    content(date)
                }
                
            }
            
            Divider()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}
    
// - Conformances
    
extension CalendarWeekListView: Equatable {
    public static func == (lhs: CalendarWeekListView<Day, Title, WeekSwiter>, rhs: CalendarWeekListView<Day, Title, WeekSwiter>) -> Bool {
        lhs.calendar == rhs.calendar && lhs.date == rhs.date
    }
}
    
// - Helpers
    
private extension CalendarWeekListView {
    func makeDays() -> [Date] {
        guard let firstWeek = calendar.dateInterval(of: .weekOfMonth, for: date),
                let lastWeek = calendar.dateInterval(of: .weekOfMonth, for: firstWeek.end - 1)
        else {
            return []
        }
            
        let dateInterval = DateInterval(start: firstWeek.start, end: lastWeek.end)
            
        print(calendar.generateDays(for: dateInterval))
            
        return calendar.generateDays(for: dateInterval)
    }
}
    
private extension Calendar {
    func generateDates(
        for dateInterval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates = [dateInterval.start]
            
        enumerateDates(
            startingAfter: dateInterval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            guard let date = date else { return }
                
            guard date < dateInterval.end else {
                stop = true
                return
            }
                
            dates.append(date)
        }
            
        return dates
    }
        
    func generateDays(for dateInterval: DateInterval) -> [Date] {
        generateDates(
            for: dateInterval,
                matching: dateComponents([.hour, .minute, .second], from: dateInterval.start)
        )
    }
}
    
private extension Date {
    func startOfMonth(using calendar: Calendar) -> Date {
        calendar.date(
            from: calendar.dateComponents([.year, .month], from: self)
        ) ?? self
    }
        
    func startOfDayTime(using calendar: Calendar) -> Date {
        calendar.date(
            from: calendar.dateComponents([.hour, .minute], from: self)
        ) ?? self
    }
}
    
private extension DateFormatter {
    convenience init(dateFormat: String, calendar: Calendar) {
        self.init()
        self.dateFormat = dateFormat
        self.calendar = calendar
    }
}
// - Previews

//#if DEBUG
struct CalendarWeekView_Previews: PreviewProvider {
    static var previews: some View {
            CalendarWeekManager(calendar: Calendar(identifier: .gregorian), selectedday: Date())
    }
}
//#endif

struct ButtonAddTask: View {
    @EnvironmentObject var taskModel: TaskViewModel
    var body: some View {
        Button(action: {
            taskModel.addNewTask.toggle()
        }, label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
                .padding()
                .background(Color("bleufonce"),in: Circle())
        })
        .padding()
        
        
    }
}
