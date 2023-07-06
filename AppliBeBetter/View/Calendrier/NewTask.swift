//
//  NewTask.swift
//  TaskManagementCoreData (iOS)
//
//  Created by Apprenante20 on 12/01/22.
//

import SwiftUI

struct NewTask: View {
    @Environment(\.dismiss) var dismiss
    
    // Task Values
    @State var taskTitle: String = ""
    @State var taskDescription: String = ""
    @State var taskDate: Date = Date()
    
    // Core Data Context
    @Environment(\.managedObjectContext) var context
    
    @EnvironmentObject var taskModel: TaskViewModel
    var body: some View {
        
        NavigationView{
            
            List{
                
                Section {
                    TextField("Aller au travail", text: $taskTitle)
                } header: {
                    Text("Titre ")
                }

                Section {
                    TextField("rien", text: $taskDescription)
                } header: {
                    Text("Description")
                }
                
                // Disabling Date for Edit Mode
                if taskModel.editTask == nil{
                    
                    Section {
                        DatePicker("", selection: $taskDate)
                            .datePickerStyle(.graphical)
                            .labelsHidden()
                            .tint(Color("bleufonce"))
                    } header: {
                        Text("Date")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Nouvelle tâche")
            .navigationBarTitleDisplayMode(.inline)
            .interactiveDismissDisabled()

            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Sauvegarder"){
                        
                        if let task = taskModel.editTask{
                            
                            task.taskTitle = taskTitle
                            task.taskDescription = taskDescription
                        }
                        else{
                            let task = TaskEntity(context: context)
                            task.taskTitle = taskTitle
                            task.taskDescription = taskDescription
                            task.taskDate = taskDate
                        }
                        
                        // Saving
                        try? context.save()
                        // Dismissing View
                        dismiss()
                    }
                    .disabled(taskTitle == "" || taskDescription == "")
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Annuler"){
                        dismiss()
                    }
                }
            }
            // Loading Task data if from Edit
            .onAppear {
                if let task = taskModel.editTask{
                    taskTitle = task.taskTitle ?? ""
                    taskDescription = task.taskDescription ?? ""
                }
            }
        }
    }
}
