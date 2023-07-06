//
//  NotifView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct NotifView: View {
    var body: some View {
        VStack {
            Text("Notification")
                .bold()
                .font(.title)
                .padding(.bottom, 8)
            NotifToogleView(texte: "Activer/Désactiver")
                .padding(.bottom, 16)
            NotifPickerView()
            Spacer()
        }
    }
}

struct NotifView_Previews: PreviewProvider {
    static var previews: some View {
        NotifView()
    }
}

struct NotifPickerView: View {
    @State private var selection = "Sonnerie"
    let sports = ["Sonnerie", "Vibration", "Sonnerie et Vibreur", "Silentieux"]
    
    @State private var rappel = ""
    let nbRappel = ["15 minutes", "30 minutes", "1 heure", "Jusqu'à réactivation",""]
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342, height: 50)
                    .foregroundColor(Color("alaric"))
                Text("Type de notification :")
                    .font(.system(size: 20))
                    .padding(.leading,15)
            }
                Picker("", selection: $selection) {
                    ForEach(sports, id: \.self) {
                        Text($0)
                     }
                .pickerStyle(.menu)
            .foregroundColor(.black)
            }
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 342, height: 50)
                    .foregroundColor(Color("alaric"))
                Text("Rendre les notification muette :")
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
