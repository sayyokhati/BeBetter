//
//  ChatAlex.swift
//  AppliBeBetter
//
//  Created by apprenant62 on 30/06/2023.
//

import SwiftUI

struct ChatAlex: View {
    
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
                    Text("\(contactDetail.contactName)")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color("bleunoir"))
                }
                .padding()
                
                HStack(spacing: 10) {
                        VStack {
                            Image(contactDetail.contactImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .center)
                                .clipShape(Circle())
                        } // end vstack
                    
                }   // end lazyhstack
                
            } // end hstack top banner
            
            
            ScrollView {
                VStack {
                    
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
                        Text("8:01 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    } // end hstack2
                    
                    
                    HStack {
                        
                        Image("Alex")
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
                        Text("8:02 AM")
                            .font(.caption)
                            .foregroundColor(.gray)

                        Spacer()
                        
                    } // end hstack2
                    HStack {
                        
                        Spacer()
                        Text("8:05 AM")
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

                            Text("8:10 AM")
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

                        Text("8:10 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    } // end hstack2
                    
                    
                    HStack {
                        
                        Image("Alex")
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
                        Text("8:35 AM")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    } // end hstack2
                    
                
                    HStack {

                        Spacer()
                        Text("8:48 AM")
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
                        Text("5:50 PM")
                        //                                .padding()
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("Bonne soirée 🍻")
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

struct ChatAlex_Previews: PreviewProvider {
    static var previews: some View {
        ChatAlex(contactDetail: Alex)
    }
}
