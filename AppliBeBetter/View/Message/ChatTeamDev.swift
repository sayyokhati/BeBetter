//
//  ChatTeamDev.swift
//  AppliBeBetter
//
//  Created by apprenant62 on 28/06/2023.
//

import SwiftUI

struct ChatTeamDev: View {
    
    @State private var arrayOfContacts : [Contacts] = tabOfTeamDev
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
                    Text("Team Dev")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color("bleunoir"))
                    // background color
                    Text("4 membres")
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

            ForEach(messages, id: \.self) { message in
                if message.contains("[USER") {
                    let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                    
                    HStack {
                        
                        Spacer()
                        Text(date, style: .time)
//                                .padding()
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(newMessage)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("bleufonce"))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                    }
                } else {
                    HStack {
 
                        Image("Alex")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                            .padding(.bottom, 10)
                        Text(message)
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            .foregroundColor(Color("bleunoir"))
                        Text(date, style: .time)
//                                .padding()
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                        
                    }
                }
            } .rotationEffect(.degrees(180))
        } .rotationEffect(.degrees(180))
                .navigationBarTitleDisplayMode(.inline)
//                .background(Color.gray.opacity(0.10))
        
        HStack {
            TextField("Écrire un message", text: $messageText)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .onSubmit {
                    sendMessage(message: messageText)
                }
                .focused($keyboardFocused)

            Button {
                sendMessage(message: messageText)
                keyboardFocused = false
            } label: {
                Image(systemName: "paperplane.fill")
            }
            .font(.system(size: 26))
            .padding(.horizontal, 10)
            .foregroundColor(Color("bleufonce"))

            
        }
        .padding()
    }
}

func sendMessage(message: String) {
    withAnimation {
        messages.append("[USER]" + message)
        self.messageText = ""
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        withAnimation {
            messages.append(getChatReponse(message: message))
        }
    }
    }
}

struct ChatTeamDev_Previews: PreviewProvider {
    static var previews: some View {
        ChatTeamDev(contactDetail: Lucie)
    }
}
