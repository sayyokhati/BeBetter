//
//  DetailEventAccueilView.swift
//  EssaiCalendar
//
//  Created by Marine Cathala-gil on 30/06/2023.
//

import SwiftUI

struct DetailEventAccueilView: View {
    
    var event:Event
    @State private var showAlert = false
    @State private var isToggleOn = false
    
    
    
    var body: some View {
            
        VStack {
//            ScrollView {
                
                ZStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("bleufonce"))
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 400, height: 150)
                        Spacer()
                    }
                    
                    StructEventAccueilView(meeting: event.meeting, heureStart: event.heureStart, heurEnd: event.heureEnd, detail: event.detail)
                        .padding(.top)
                    
                }
                
                VStack(alignment:.leading, spacing: 16) {
                    Spacer()
                    
                    HStack {
                        Toggle(isOn: $isToggleOn) {
                            Text("Alerte")
                                .bold()
                                .font(.title2)
                        }
                        .tint(Color("bleu"))
                        .onChange(of: isToggleOn) { newValue in
                            showAlert = newValue
                            
                        }
                        
                    }
                    
                    
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Alerte"), message: Text("Vous recevrez une alerte 1h avant"), dismissButton: .default(Text("OK")))
                        //                            .tint(Color("bleu"))
                        
                    }
                    
                    Divider()
                    Spacer()
                    Text("Description:")
                        .bold()
                        .font(.title2)
                    Text("Prépa:")
                    Text("Établir ordre du jour, rassembler")
                    Text("documents, confirmer participants,")
                    Text("vérifier équipement et réserver salle")
                    
                    
                    
                }
                
                .padding(.trailing)
                .padding(.leading)
                
                .padding(.bottom, 100)
                
                
                Divider()
                Text("Supprimer l'évènement")
                    .font(.title2)
                    .foregroundColor(.red)
                
                Spacer()
            
                
            }
            
            .navigationTitle("Détails évènement")
        
    }
    
    
}



struct DetailEventAccueilView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailEventAccueilView(event: Event(meeting: "Rendez-vous", heureStart: "12:00", heureEnd: "13:00", detail: "Michel"))
        }
    }
}
