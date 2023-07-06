//
//  ChatView.swift
//  BeBetter
//
//  Created by apprenant62 on 26/06/2023.
//

import SwiftUI

struct ChatView: View {
    
    @State private var messageText = ""
    @State var messages: [String] = ["Salut Karine"]
    @FocusState private var keyboardFocused: Bool
    let date = Date()
    
    var contactDetail : Contacts

    var body: some View {
        
        VStack {

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
                    
                    ForEach(messages, id: \.self) { message in
                        if message.contains("[USER") {
                            let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                            
                            HStack {
                                
                                Spacer()
                                Text(date, style: .time)
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
                                
                                Image("\(contactDetail.contactImage)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .padding(.leading, 16)
                                    .padding(.bottom, 10)
                                Text(message)
                                    .padding()
                                    .background(Color.gray.opacity(0.20))
                                    .cornerRadius(10)
                                    .padding(.horizontal, 16)
                                    .padding(.bottom, 10)
                                    .foregroundColor(Color("bleunoir"))
                                Text(date, style: .time)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Spacer()
                                
                            }
                        }
                    } .rotationEffect(.degrees(180))
                } .rotationEffect(.degrees(180))
                    .navigationBarTitleDisplayMode(.inline)
//                    .background(Color.gray.opacity(0.10))
//                    .rotationEffect(.degrees(180))
            } // end vstack conversation
//            .background(Color("bleufonce").opacity(0.2))
            
            
            VStack {
                HStack {
                    TextField("Écrire un message", text: $messageText)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .foregroundColor(.black)
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
                    
                    
                } // end hstack envoyer un message
                .padding()
//                .background(Color("bleufonce").opacity(0.2))
                .ignoresSafeArea()
            } // end vstack
            
            
        } // end vstack
        
        
        
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

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(contactDetail: Lucie)
    }
}
