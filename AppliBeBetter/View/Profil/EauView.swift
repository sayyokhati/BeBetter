//
//  EauView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct EauView: View {
    
    
    var body: some View {
        
        
        VStack {
            Text("Hydratation")
                .bold()
                .font(.title)
                .padding(.bottom, 8)
            NotifToogleView(texte: "Activer/Désactiver")
                .padding(.bottom, 16)
            EauPickerView()
            Spacer()
        } // end vstack
        
        
    }
}

struct EauView_Previews: PreviewProvider {
    static var previews: some View {
        EauView()
    }
}

struct EauPickerView: View {
    @State private var notification = "Sonnerie"
    let typeNotification = ["Sonnerie", "Vibreur", "Sonnerie et Vibreur", "Silencieux"]
    
    @State private var rappel = "1 fois/heure"
    let nbRappel = ["1 fois/heure", "2 fois/heure", "3 fois/heure", "4 fois/heure"]
    
    @State private var boisson = "Eau"
    let typeBoisson = ["Eau", "Eau détox", "Thé vert", "Jus de fruit/légume"]
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342, height: 50)
                    .foregroundColor(Color("alaric"))
                Text("Type de boisson :")
                    .font(.system(size: 20))
                    .padding(.leading,15)
            }
            Picker("", selection: $boisson) {
                ForEach(typeBoisson, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342, height: 50)
                    .foregroundColor(Color("alaric"))
                Text("Type de notification :")
                    .font(.system(size: 20))
                    .padding(.leading,15)
            }
                Picker("", selection: $notification) {
                    ForEach(typeNotification, id: \.self) {
                        Text($0)
                    }
                .pickerStyle(.menu)
            }
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342, height: 50)
                    .foregroundColor(Color("alaric"))
                Text("Récurrence :")
                    .font(.system(size: 20))
                    .padding(.leading,15)
            }
                Picker("", selection: $rappel) {
                    ForEach(nbRappel, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
            
        }
    }
}
