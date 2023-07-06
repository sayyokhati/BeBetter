//
//  ProfilView.swift
//  AppliBeBetter
//
//  Created by Marine Cathala-gil on 21/06/2023.
//

import SwiftUI

struct ProfilView: View {
    
    var cadre: Color = Color("bleufonce")
    @ObservedObject var profile: Profile
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 393, height: 220)
                        .foregroundColor(cadre)
                    .edgesIgnoringSafeArea(.all)
                    Spacer()
                }
                VStack {
                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(Color("bleu"))
//                            .edgesIgnoringSafeArea(.all)
//                            .frame(width: 350, height: 100)                                                
                        VStack(alignment: .leading) {
                            HStack {
                                
                                Image(profile.myPicture)
                                    .resizable()
                                    .clipShape(Circle())
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                VStack {
                                    Text(profile.myLastName)
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(Color("bleunoir"))
                                        .padding(.trailing, 30)
                                        .padding(.leading, 20)
                                    Text(profile.myName)
                                            .font(.title)
                                            .bold()
                                            .foregroundColor(Color("bleunoir"))
                                        .padding(.trailing, 30)
                                        .padding(.leading, 20)
                                    
                                }
                            }
                            .padding(.top)
                        }
                    }
                    .padding(.bottom, 50)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 342, height: 120)
                            .foregroundColor(Color("bleu"))
                        VStack {
                            NavigationLink {
                                ParametreView(profile: profiles[0])
                            } label: {
                                HStack {
                                    ParametreButtonView(icon: "gearshape.fill", hauteur: 33, largeur: 35, texte: "Paramètres")
                                }
                            }
                            Divider()
                                .frame(width: 335)
                            NavigationLink {
                                ListContactView(myListOfContactVM: ContactDetailVM(allContacts: allContacts))
                            } label: {
                                ParametreButtonView(icon: "person.2.fill", hauteur: 25, largeur: 35, texte: "Contacts")
                            }
                        }
                    }
                    .padding(.bottom)
                    ProfileToogleView(texte: "Boire de l'eau")
                    Divider()
                        .frame(width: 300)
                    ProfileToogleView(texte: "Faire du sport")
                    Divider()
                        .frame(width: 300)
                    ProfileToogleView(texte: "Prendre la pause")
                    Divider()
                        .frame(width: 300)
                    ProfileToogleView(texte: "Messagerie")
                    Spacer()
                }//Fin de la VStack principale
            }
        } //Fin du body
    }
}
struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView(profile: profiles[0])
    }
}




