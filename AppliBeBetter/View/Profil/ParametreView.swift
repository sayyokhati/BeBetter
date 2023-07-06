//
//  ParametreView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 28/06/2023.
//

import SwiftUI

struct ParametreView: View {
    
    var profile: Profile

    var body: some View {
        NavigationStack() {
            VStack {
                NavigationLink {
                    ModifierProfileView(profile: profiles[0])
                } label: {
                    HStack(alignment: .center, spacing: 10) {
                        Image(profile.myPicture)
                            .resizable()
                            .frame(width: 110, height: 110)
                        Text("Mon compte")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.top, 64)
                .padding(.bottom, 16)
                    VStack(spacing: 30) {
                        HStack(spacing: 30){
                            NavigationLink {
                                SportParameterView()
                            } label: {
                                NotificationButtonView(icone: Image("sport1"), label: "Rappel d'activité sportive")
//                                    .navigationBarTitleDisplayMode(.inline)

                            }
                            NavigationLink {
                                NotifView()
                            } label: {
                                NotificationButtonView(icone: Image("message"), label: "Notifications des messages")
                                    .navigationBarTitleDisplayMode(.inline)

                            }
                        }
                        HStack(spacing: 30){
                            NavigationLink {
                                EauView()
                            } label: {
                                NotificationButtonView(icone: Image("eau"), label: "Hydratation")
                                    .navigationBarTitleDisplayMode(.inline)
                            }
                            NavigationLink {
                                PauseView()
                            } label: {
                                NotificationButtonView(icone: Image("heure"), label: "Gestion des              pauses")
                                    .navigationBarTitleDisplayMode(.inline)

                            }

                        }
                    }
                    Spacer()
                    
                }
                .navigationTitle("Paramètres")
            .navigationBarTitleDisplayMode(.large)
        }
           }
}

struct ParametreView_Previews: PreviewProvider {
    static var previews: some View {
        ParametreView(profile: profiles[0])
    }
}


