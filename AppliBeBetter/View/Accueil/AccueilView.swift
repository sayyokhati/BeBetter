//
//  AccueilView.swift
//  AppliBeBetter
//
//  Created by Marine Cathala-gil on 21/06/2023.
//

import SwiftUI

struct AccueilView: View {
//    @State private var isButtonClicked = false

    @EnvironmentObject var vm: HealthKitViewModel
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    let calendarWeekManager = CalendarWeekManager(calendar: Calendar(identifier: .gregorian), selectedday: Date.now)
//    let calendarViewToday = CalendarWeekManager(calendar: Calendar(identifier: .gregorian), selectedday: Date.now)
//    let calendarViewTomorrow = CalendarWeekManager(calendar: Calendar(identifier: .gregorian), selectedday: Date.tomorrow)
    
    @ObservedObject var profile: Profile
    
    @State var day = "Aujourd'hui"
    @State var music = "Zen"
    
    
    var body: some View {
        
        NavigationStack {
            
            
            VStack {
                ZStack {
                    VStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("bleufonce"))
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 400, height: 250)
                        Spacer()
                    }
                    VStack {
                        
                        BanniereProfilView(profile: profiles[0])
                        
                        DaySwitcherView(day: $day)
                        HStack(spacing: 12) {
                            
//                            BanniereCompteurPasView()
                        
                            
                            
                            
                            if day == "Demain" {
                                BanniereCompteurPasView(stepCount: "---")
                                BannierePlaylistView(music: "---")
                            }
                            if day == "Aujourd'hui" {
                                BanniereCompteurPasView(stepCount: "\(vm.userStepCount)")
                                BannierePlaylistView(music: "Zen")
                            }
                            if day == "Hier" {
                                BanniereCompteurPasView(stepCount: "\(vm.previousWeekCount[5].count, specifier:"%.f")")
                                BannierePlaylistView(music: "Motivation")
                            }
                            
                                }
                        
                            
                        .padding()
                        
                        
                        
                       
                            }
                        }
                NavigationStack {
                    ScrollView() {
                        VStack {
                            
                            if (day == "Hier") {
                                calendarWeekManager.TasksView(currentDate: Date.yesterday)
                            }
                            if (day == "Aujourd'hui") {
                                calendarWeekManager.TasksView()
                            }
                            if (day == "Demain") {
                                calendarWeekManager.TasksView(currentDate: Date.tomorrow)
                            }
                            
                            Spacer()
                            
                        }
                    }
                }
                
                        Spacer()
                        
                    }
                }
            }
        }
        
    


struct AccueilView_Previews: PreviewProvider {
    static var previews: some View {
        AccueilView(profile: profiles[0])
            .environmentObject(HealthKitViewModel())
        
    }
}


extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
}
