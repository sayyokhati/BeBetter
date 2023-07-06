//
//  MessageView.swift
//  BeBetter
//
//  Created by apprenant62 on 22/06/2023.
//

import SwiftUI

struct MessageView: View {
    
    @State private var arrayOfContacts : [Contacts] = allContacts
    let date = Date()
    @State var textToSearch = ""

    var calendar: Calendar
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Section {
                    
                    ScrollView(.horizontal) {
                        
                        LazyHStack(alignment: .center, spacing: 1) {
                            
                            ForEach(arrayOfContacts) { contacts in
                                
                                NavigationLink {
                                    ChatView(contactDetail: contacts)
                                } label: {
                                    ContactRowView(myContact: contacts)
                                }
                                
                            }
                        } // end lazyhstack
                        .padding()
                        .padding(.top, 16)
                        .padding(.bottom, 16)
                        
                    } // end scroll view
                    .frame(height: 80)
                    
                } // end section
                header : {
                    Text("Récents")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("bleunoir"))
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    
                    
                }
                .headerProminence(.increased)
                
                ScrollView {
                    
                    Spacer()
                    
                    VStack {
                        
                        NavigationLink {
                            ChatTeamDev(contactDetail: Lucie)
                        } label: {
                            VStack (spacing: 0) {
                                HStack {
                                    Text("Team Dev")
//                                        .font(.system(size:20))
                                        .bold()
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Text(date, style: .time)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                } // end hstack
                                .padding(.bottom, -20)
                                
                                HStack {
                                    Text("Alex: Bonjour à tous.")
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Image(systemName: "1.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(Color("bleufonce"))
                                        .padding()
                                    
                                } // end hstack2
                            } // end vstack
                            .frame(width: 345, height: 85)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1))
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            
                            
                        }
                        
                    } // end vstack Team Dev
                    
                    VStack {
                        
                        NavigationLink {
                            ChatTeamManager(contactDetail: Pierre)
                        } label: {
                            VStack (spacing: 0) {
                                HStack {
                                    Text("Team Manager")
                                        .bold()
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Text("9:50 AM")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                } // end hstack
                                .padding(.bottom, -20)

                                HStack {
                                    Text("Moi: Je vous envoie l'invitation 💪🏻")
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Image(systemName: "")
                                        .font(.headline)
                                        .foregroundColor(Color("bleu"))
                                        .padding()
                                    
                                } // end hstack2
                            } // end vstack
                            .frame(width: 345, height: 85)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1))
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            
                            
                        }         .navigationBarTitleDisplayMode(.inline)
                        
                    } // end vstack Team Manager
                    
                    VStack {
                        
                        NavigationLink {
                            ChatEugenie(contactDetail: Eugenie)
                        } label: {
                            VStack (spacing: 0) {
                                HStack {
                                    Text("Eugénie")
                                        .bold()
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Text("8:50 AM")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                } // end hstack
                                .padding(.bottom, -20)

                                HStack {
                                    Text("Eugénie: N'hésite pas à en parler à tes équipes")
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Image(systemName: "2.circle.fill")
                                        .font(.headline)
                                        .foregroundColor(Color("bleufonce"))
                                        .padding()
                                    
                                } // end hstack2
                            } // end vstack
                            .frame(width: 345, height: 85)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1))
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            
                            
                        }         .navigationBarTitleDisplayMode(.inline)
                        
                    } // end vstack Eugénie
                    
                    VStack {
                        
                        NavigationLink {
                            ChatAlex(contactDetail: Alex)
                        } label: {
                            VStack (spacing: 0) {
                                HStack {
                                    Text("Alex")
                                        .bold()
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Text("Hier 5:50 PM")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                } // end hstack
                                .padding(.bottom, -20)

                                    HStack {
                                        Text("Moi: Bonne soirée 🍻")
                                            .foregroundColor(Color("bleunoir"))
                                            .padding()
                                        Spacer()
                                        Image(systemName: "")
                                            .font(.headline)
                                            .foregroundColor(Color("bleu"))
                                            .padding()
                                    
                                    } // end hstack2
                            } // end vstack
                            .frame(width: 345, height: 85)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1))
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            
                            
                        }         .navigationBarTitleDisplayMode(.inline)
                        
                    } // end vstack Alex
                    
                    VStack {
                        
                        NavigationLink {
                            ChatAlex(contactDetail: Ibrahim)
                        } label: {
                            VStack (spacing: 0) {
                                HStack {
                                    Text("Ibrahim")
                                        .bold()
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Text("Hier 3:30 PM")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .padding()
                                    
                                } // end hstack
                                .padding(.bottom, -20)

                                HStack {
                                    Text("Ibrahim: Salut Karine")
                                        .foregroundColor(Color("bleunoir"))
                                        .padding()
                                    Spacer()
                                    Image(systemName: "")
                                        .font(.headline)
                                        .foregroundColor(Color("bleu"))
                                        .padding()
                                    
                                } // end hstack2
                            } // end vstack
                            .frame(width: 345, height: 85)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1))
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                            
                            
                        }         .navigationBarTitleDisplayMode(.inline)
                        
                    } // end vstack Alex
                    
                } // end scroll view
                
                HStack {
                    
                NavigationLink {
                    CreateEventView()
                } label: {
                    Text("Créer un évènement")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("bleufonce"))
                .frame(height: 80)

                NavigationLink {
                    PraticienListView()
                } label: {
                    Text("Rencontrer un pro")
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("bleufonce"))
                    

                } // end hstack button
                
            } // end vstack
            
        } // end nav view
        .searchable(text: $textToSearch, placement: .navigationBarDrawer(displayMode: .always), prompt: "Chercher un contact, une équipe")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func searchUsers() -> [Contacts] {
        
        if textToSearch.isEmpty {
            return allContacts
        } else {
            return allContacts.filter { $0.contactName.contains(textToSearch) }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(calendar: Calendar(identifier: .gregorian))
    }
}


struct ContactRowView: View {
    
    var myContact: Contacts
    
    var body: some View {
        
                
        VStack {
                    
            Image(myContact.contactImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            
            
//                    .overlay {
//                        Circle()
//                            .stroke(lineWidth: 3)
//                            .foregroundColor(.green)
//                    }
            

            
            Text(myContact.contactName)
                .foregroundColor(.black)
                        .font(.system(size: 14))
                        .frame(width: 50)
                        

                } // endvstack
        .padding(.trailing, 10)
        
    }
}



