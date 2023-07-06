//
//  SportParameterView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct SportParameterView: View {
    @State private var sportSelection = "Course"
    let sports = ["Course", "Yoga", "Aller à la salle", "Méditation"]
    
    @State private var rappel = "1 fois/semaine"
    let nbRappel = ["1 fois/semaine", "2 fois/semaine", "4 fois/semaine", "6 fois/semaine"]
    @State private var showAlert = false
    @State private var isToggleOn = false

    var body: some View {
        
        VStack {
            Text("Sport")
                .bold()
                .font(.title)
                .padding(.bottom, 8)
            VStack(alignment: .leading) {
                NotifToogleView(texte: "Activer/Désactiver")
                    .padding(.bottom, 16)
                VStack(alignment: .leading) {
                    Text("Activité 1 :")
                        .font(.system(size: 20))
                        .foregroundColor(Color("bleunoir"))
                        .padding(.leading,15)
                    SportPickerView()
                    //                Divider()
                    //                    .frame(width: 300)
                    Text("Activité 2 :")
                        .font(.system(size: 20))
                        .foregroundColor(Color("bleunoir"))
                    
                        .padding(.leading,15)
                    SportPickerView()
                    //                Divider()
                    //                    .frame(width: 300)
                    Text("Activité 3 :")
                        .font(.system(size: 20))
                        .foregroundColor(Color("bleunoir"))
                    
                        .padding(.leading,15)
                    SportPickerView()
                    //                Divider()
                    //                    .frame(width: 300)
                    Text("Activité 4 :")
                        .font(.system(size: 20))
                        .foregroundColor(Color("bleunoir"))
                    
                        .padding(.leading,15)
                    SportPickerView()
                } .padding()
                
            }
        }     }
}

struct SportParameterView_Previews: PreviewProvider {
    static var previews: some View {
        SportParameterView()
    }
}

struct SportPickerView: View {
    @State private var selection = "Course"
    let sports = ["Course", "Yoga", "Aller à la salle", "Méditation"]
    
    @State private var rappel = "1 fois/semaine"
    let nbRappel = ["1 fois/semaine", "2 fois/semaine", "4 fois/semaine", "6 fois/semaine"]
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342, height: 50)
                    .foregroundColor(Color("alaric"))
                Picker("", selection: $selection) {
                    ForEach(sports, id: \.self) {
                        Text($0)
                            .foregroundColor(Color("bleunoir"))

                    }
                }
                .pickerStyle(.menu)
            .foregroundColor(.black)
            }
            
   
                Picker("", selection: $rappel) {
                    ForEach(nbRappel, id: \.self) {
                        Text($0)
                            .foregroundColor(Color("bleunoir"))

                    }
                }
                .pickerStyle(.menu)
            
        }
    }
}
