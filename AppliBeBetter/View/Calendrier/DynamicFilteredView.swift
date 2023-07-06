//
//  DynamicFilteredView.swift
//  TaskManagementCoreData (iOS)
//
//  Created by Apprenante20 on 12/01/22.
//

import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View,T>: View where T: NSManagedObject {
    // Core Data Request
    @FetchRequest var request: FetchedResults<T>
    let content: (T)->Content
    
    // Building Custom ForEach which will give Coredata object to build View
    init(dateToFilter: Date,@ViewBuilder content: @escaping (T)->Content){
    
        // Predicate to Filter current date Tasks
        let calendar = Calendar.current
        
        let today = calendar.startOfDay(for: dateToFilter)
        let tommorow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        // Filter Key
        let filterKey = "taskDate"
        
        // This will fetch task between today and tommorow which is 24 HRS
        let predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@", argumentArray: [today,tommorow])
        
        // Intializing Request With NSPredicate
        // Adding Sort
        _request = FetchRequest(entity: T.entity(), sortDescriptors: [.init(keyPath: \TaskEntity.taskDate, ascending: false)], predicate: predicate)
        self.content = content
    }
    
    var body: some View {
        
            if request.isEmpty{
                Text("Vous n'avez pas de tâche")
                    .font(.system(size: 16))
                    .fontWeight(.light)
                    .offset(y: 100)
                    .foregroundColor(.gray)
            }
            else{
                
                ForEach(request,id: \.objectID){object in
                    self.content(object)
                }
            }
        }
    }
