//
//  ModifierProfileView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct ModifierProfileView: View {
    
    @ObservedObject var profile: Profile
    @State private var anciennete = 1
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                VStack {
                    Image(profile.myPicture)
                    Text("Changer la photo")
                        .padding(5)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .cornerRadius(10)
                }
                VStack(alignment: .leading) {
                        Text("Nom :")
                            .font(.system(size: 20))
                            .padding(.leading,15)
                    TextField("", text: $profile.myLastName)
                        .textFieldStyle(.roundedBorder)

                        Text("Prenom :")
                            .font(.system(size: 20))
                            .padding(.leading,15)
                    TextField("", text: $profile.myName)
                        .textFieldStyle(.roundedBorder)
           
                        Text("Poste :")
                            .font(.system(size: 20))
                            .padding(.leading,15)
                    TextField("", text: $profile.myJob)
                        .textFieldStyle(.roundedBorder)
         
                        Text("E-mail :")
                            .font(.system(size: 20))
                            .padding(.leading,15)
                    TextField("", text: $profile.myMail)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.leading, 16)
                VStack(alignment: .leading) {
                        Text("Ancienneté :")
                            .font(.system(size: 20))
                            .padding(.leading,15)
                    Picker("", selection: $profile.ageJob) {
                        ForEach(1...10, id: \.self) {
                            Text("Dans l'entrprise depuis \($0) ans")
                        }
                    }
                }
                .padding(.trailing, 100)
            }
            .padding(.top, 64)
        }
    }
}

struct ModifierProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ModifierProfileView(profile: profiles[0])
    }
}


