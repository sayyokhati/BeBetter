//
//  ChatTeamManager.swift
//  AppliBeBetter
//
//  Created by apprenant62 on 30/06/2023.
//

import SwiftUI

struct ChatTeamManager: View {
    
    @State private var arrayOfContacts : [Contacts] = tabOfTeamManager
    var contactDetail : Contacts

    @State private var messageText = ""
    @State var messages: [String] = ["Bonjour à tous"]
    @State var message1: [String] = ["J'espère que vous allez bien ?"]
    @FocusState private var keyboardFocused: Bool
    let date = Date()
    
    var body: some View {
                        
        VStack {
            HStack {
                
                VStack (alignment: .leading) {
                    Text("Team Manager")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color("bleunoir"))
                    Text("3 membres")
                        .foregroundColor(.gray)
                }
                .padding()
                
                HStack(spacing: 10) {
                    ForEach(arrayOfContacts) { contact in
                        VStack {
                            Image(contact.contactImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .center)
                                .clipShape(Circle())
                        } // end vstack
                    }
                }   // end lazyhstack
                
            } // end hstack top banner
            
            
            ScrollView {
                VStack {
                    HStack {
                        
                        Spacer()
                        Text("9:05 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Meeting cet après-midi pour faire un point ?")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("bleufonce"))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                        } // end hstack1
                        HStack {
                            
                            Image("")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                                .padding(.bottom, 10)
                            Text("C'est bon pour moi")
                                .padding()
                                .background(.gray.opacity(0.15))
                                .cornerRadius(10)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 10)
                                .foregroundColor(Color("bleunoir"))
                            Text("9:10 AM")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Spacer()
                            
                        } // end hstack2
                    
                    HStack {
                        
                        Image("")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                            .padding(.bottom, 10)
                        Text("Plutôt en fin d'après-midi")
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            .foregroundColor(Color("bleunoir"))
                        Text("9:10 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    } // end hstack2
                    
                    
                    HStack {
                        
                        Image("Eugenie")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                            .padding(.bottom, 10)
                        Text("Pierre ?")
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            .foregroundColor(Color("bleunoir"))
                        Text("9:35 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    } // end hstack2
                    
                    HStack {
                        
                        Image("")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                            .padding(.bottom, 10)
                        Text("Oui 👍")
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            .foregroundColor(Color("bleunoir"))
                        Text("9:42 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    } // end hstack2
                    
                    HStack {
                        
                        Image("Pierre")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                            .padding(.bottom, 10)
                        Text("C'est plus que nécessaire")
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            .foregroundColor(Color("bleunoir"))
                        Text("9:46 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    } // end hstack2
                    
                    HStack {

                        Spacer()
                        Text("9:48 AM")
                        //                                .padding()
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Parfait")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("bleufonce"))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                        } // end hstack1
                    
                    HStack {
                        
                        Spacer()
                        Text("9:50 AM")
                        //                                .padding()
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Je vous envoie l'invitation 💪🏻")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("bleufonce"))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                        } // end hstack1
                    
                } // end vstack
                .rotationEffect(.degrees(180))
            } // end scroll view
            .rotationEffect(.degrees(180))

            
            HStack {
                TextField("Écrire un message", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        //                    sendMessage(message: messageText)
                    }
                    .focused($keyboardFocused)
                
                Button {
                    //                sendMessage(message: messageText)
                    keyboardFocused = false
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 26))
                .padding(.horizontal, 10)
                .foregroundColor(Color("bleufonce"))
                
                
            }
            .padding()
            
            } // end vstack
        }
    }

struct ChatTeamManager_Previews: PreviewProvider {
    static var previews: some View {
        ChatTeamManager(contactDetail: Lucie)
    }
}
