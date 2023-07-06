//
//  AppliBeBetterApp.swift
//  AppliBeBetter
//
//  Created by Marine Cathala-gil on 21/06/2023.
//

import SwiftUI

@main

struct AppliBeBetterApp: App {
    @StateObject var vm = HealthKitViewModel()
    @StateObject var dateHolder = DateHolder()
    let persistenceController = PersistenceController.shared
    @StateObject var taskViewModel = TaskViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            
            LoadingScreenView()
            
                .environmentObject(dateHolder)
                .environmentObject(vm)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(taskViewModel)
        }
    }
}
