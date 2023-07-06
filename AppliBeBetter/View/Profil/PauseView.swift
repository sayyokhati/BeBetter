//
//  PauseView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct PauseView: View {
    
    
    var body: some View {

                VStack {
                    Text("Pause")
                        .foregroundColor(Color("bleunoir"))

                        .bold()
                        .font(.title)
                        .padding(.bottom, 8)
                    NotifToogleView(texte: "Activer/Désactiver")
                        .padding(.bottom, 16)
                        .padding(.leading, 20)

                    PausePickerView()
                    Divider()
                        .frame(width: 300)
                    PausePickerView()
                    Spacer()
                }
            }
        }

struct PauseView_Previews: PreviewProvider {
    static var previews: some View {
        PauseView()
    }
}

struct PausePickerView: View {
    
    @State private var currentDate = Date()
    @State private var givenDate = Date()
    
    @State private var pauseSelection = "15 min"
    let pause = ["15 min", "Repas du midi"]
    
    @State private var rappel = "1 fois/jour"
    let nbRappel = ["1 fois/jour", "2 fois/jour", "3 fois/jour"]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342, height: 50)
                    .foregroundColor(Color("alaric"))
                Picker("", selection: $pauseSelection) {
                    ForEach(pause, id: \.self) {
                        Text($0)
                            .foregroundColor(Color("bleunoir"))

                    }
                }
                .pickerStyle(.menu)
            }
            
            
            DatePicker("Début",selection: $currentDate, displayedComponents: [.date, .hourAndMinute])
                .padding(.trailing, 20)
            .pickerStyle(.menu)
            
            DatePicker("Fin",selection: $givenDate, displayedComponents: [.date, .hourAndMinute])
                .padding(.trailing, 20)
            .pickerStyle(.menu)
            
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
    }
}
