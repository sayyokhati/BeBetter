//
//  HealthKitViewModel.swift
//  EssaiCalendar
//
//  Created by Marine Cathala-gil on 27/06/2023.
//

import Foundation
import HealthKit

class HealthKitViewModel:ObservableObject{
    
    private var healthStore = HKHealthStore()
    private var healthKitManager = HealthKitManager()
    @Published var userStepCount = "Aucune données"
    @Published var previousWeekCount : [ToyShape] = Array(repeating: ToyShape(type: "", count: 0), count: 7)
    @Published var isAuthorized = false

    func healthRequest() {
        healthKitManager.setUpHealthRequest(healthStore: healthStore) {
            self.changeAuthorizationStatus()
            self.readStepsTakenWeek()
            self.readStepsTakenToday()
        }
    }
    
    func readStepsTakenToday() {
        healthKitManager.readStepCount(healthStore: healthStore) { step in
            if step != 0.0 {
                DispatchQueue.main.async {
                    self.userStepCount = String(format: "%.0f", step)
                }
            }
        }
    }
    
    func readStepsTakenWeek() {
        
        let previousWeek = [
            0: Calendar.current.date(byAdding: .day, value: -6, to: Date()),
            1: Calendar.current.date(byAdding: .day, value: -5, to: Date()),
            2: Calendar.current.date(byAdding: .day, value: -4, to: Date()),
            3: Calendar.current.date(byAdding: .day, value: -3, to: Date()),
            4: Calendar.current.date(byAdding: .day, value: -2, to: Date()),
            5: Calendar.current.date(byAdding: .day, value: -1, to: Date()),
            6: Date()
        ]
        
        for (index,day) in previousWeek {
            if let day {
                healthKitManager.readStepCount(forToday: day, healthStore: healthStore) { step in
                    if step != 0.0 {
                        DispatchQueue.main.async {
                            let formater = DateFormatter()
                            let weekDay = Calendar.current.component(.weekday, from: day)
                            let symbol = formater.shortWeekdaySymbols[weekDay - 1]
                            let newDay = ToyShape(type: symbol, count: step)
                            self.previousWeekCount[index] = newDay
                        }
                    }
                }
            }
        }
    }

    func changeAuthorizationStatus() {
        guard let stepQtyType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        let status = self.healthStore.authorizationStatus(for: stepQtyType)
        
        DispatchQueue.main.async {
            switch status {
            case .notDetermined:
                self.isAuthorized = false
            case .sharingDenied:
                self.isAuthorized = false
            case .sharingAuthorized:
                self.isAuthorized = true
            default:
                self.isAuthorized = false
            }
        }
    }
}

