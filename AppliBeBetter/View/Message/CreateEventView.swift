//
//  CreateEventView.swift
//  BeBetter
//
//  Created by apprenant62 on 22/06/2023.
//

import SwiftUI

struct CreateEventView: View {
    
    @State private var whatEvent = "Évènement"
    var events = ["RDV", "Appel", "Café", "Pause"]
    
    @State private var eventName = ""
    @State private var eventDescription = ""

    @State private var arrayOfContacts : [Contacts] = allContacts
    
    @State private var fulldayToggle = false
    
    @State private var currentDate = Date()

    @State private var givenDate = Date()
    
    @State private var selectedRecurrence = "Choisir la récurrence"
    
    let recurrenceDays = ["Chaque lundi", "Chaque mardi", "Chaque mercredi", "Chaque jeudi", "Chaque vendredi", "Jamais"]
    
    @State private var showToast: Bool = false
        
    @State private var didTap : Bool = false
    @State private var didTap1 : Bool = false
    @State private var didTap2 : Bool = false
    @State private var didTap3 : Bool = false
    @State private var didTap4 : Bool = false
    @State private var didTap5 : Bool = false
    @State private var didTap6 : Bool = false
    @State private var didTap7 : Bool = false
    @State private var didTap8 : Bool = false
    
        
    var body: some View {
        
        ScrollView {
            VStack {
                
                Picker("", selection: $whatEvent) {
                    ForEach(events, id: \.self) {
                        Text($0)
                            .foregroundColor(Color("bleunoir"))
                    }
                }
                .pickerStyle(.segmented)
                .frame(width: 360)
                .padding(.bottom, 16)
                
                //                   Text("\(whatEvent)")
                //                .bold()
                
                Section(header: Text("**Nom de l'évènement**")) {
                    
                    TextField("Ecrire ici", text: $eventName)
                        .padding(.bottom, 8)
                        .padding(.top, 8)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .textFieldStyle(.roundedBorder)
                    
                } // end nom de l'event
                
                
                Text("Membres")
                    .bold()
                    .foregroundColor(Color("bleunoir"))
                
                Section {
                    
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .center, spacing: 10) {
                        
                        Button {
                            resetButtons()
                            self.didTap = true
                        } label: {
                            VStack {
                                Image(Marc.contactImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .overlay(didTap ? .clear : Color.white.opacity(0.5))
                                    .clipShape(Circle())

                                Text(Marc.contactName)
                                    .font(.system(size: 14))
                                    .frame(width: 40)
                                    .foregroundColor(Color("bleunoir"))
                            }
                        } // end button Marc

                            Button {
                                resetButtons()
                                self.didTap1 = true
                            } label: {
                                VStack {
                                    Image(Lucie.contactImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .overlay(didTap1 ? .clear : Color.white.opacity(0.5))
                                        .clipShape(Circle())

                                    Text(Lucie.contactName)
                                        .font(.system(size: 14))
                                        .frame(width: 40)
                                        .foregroundColor(Color("bleunoir"))
                                }
                            } // end button Lucie
                            
                            Button {
                                resetButtons()
                                self.didTap2 = true
                            } label: {
                                VStack {
                                    Image(Pierre.contactImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .overlay(didTap2 ? .clear : Color.white.opacity(0.5))
                                        .clipShape(Circle())

                                    Text(Pierre.contactName)
                                        .font(.system(size: 14))
                                        .frame(width: 40)
                                        .foregroundColor(Color("bleunoir"))
                                }
                            } // end button Pierre
                            
                            Button {
                                resetButtons()
                                self.didTap3 = true
                            } label: {
                                VStack {
                                    Image(Alex.contactImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .overlay(didTap3 ? .clear : Color.white.opacity(0.5))
                                        .clipShape(Circle())

                                    Text(Alex.contactName)
                                        .font(.system(size: 14))
                                        .frame(width: 40)
                                        .foregroundColor(Color("bleunoir"))
                                }
                            } // end button Alex
                            
                            
                            Button {
                                resetButtons()
                                self.didTap4 = true
                            } label: {
                                VStack {
                                    Image(Eugenie.contactImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .overlay(didTap4 ? .clear : Color.white.opacity(0.5))
                                        .clipShape(Circle())

                                    Text(Eugenie.contactName)
                                        .font(.system(size: 14))
                                        .frame(width: 40)
                                        .foregroundColor(Color("bleunoir"))
                                }
                            } // end button Alex
                            
                            Button {
                                resetButtons()
                                self.didTap4 = true
                            } label: {
                                VStack {
                                    Image(Ibrahim.contactImage)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .overlay(didTap4 ? .clear : Color.white.opacity(0.5))
                                        .clipShape(Circle())

                                    Text(Ibrahim.contactName)
                                        .font(.system(size: 14))
                                        .frame(width: 40)
                                        .foregroundColor(Color("bleunoir"))
                                }
                            } // end button Alex
                        
        
                        } // end lazyhstack
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        
                        
                    } // end scroll view
                    .frame(height: 80)
                    
                } // end membres
                
                Section {
                    Text("Description")
                        .bold()
                        .foregroundColor(Color("bleunoir"))

                    
                    TextField("Décrire l'évènement", text: $eventDescription, axis: .vertical)
                        .padding(.bottom, 16)
                        .padding(.top, 8)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(5, reservesSpace: true)
                } // end Description
                
                Section {
                    Text("Date et heure")
                        .bold()
                        .foregroundColor(Color("bleunoir"))
                    
                    Toggle("Jour entier", isOn: $fulldayToggle)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .tint(Color("bleu"))
                        .foregroundColor(Color("bleunoir"))

                    DatePicker("Début", selection: $currentDate, displayedComponents: [.date, .hourAndMinute])
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .foregroundColor(Color("bleunoir"))

                    DatePicker("Fin", selection: $givenDate, displayedComponents: [.date, .hourAndMinute])
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.bottom, 16)
                        .foregroundColor(Color("bleunoir"))

                    
                } // end date et heure
                
                Section {
                    Text("Récurrence")
                        .bold()
                        .foregroundColor(Color("bleunoir"))

                    
                    DisclosureGroup(selectedRecurrence, content: {
                        ForEach(recurrenceDays, id: \.self) { recurrence in
                            Button(action: {
                                selectedRecurrence = recurrence
                            }) {
                                Text(recurrence)
                                    .padding(.bottom, 6)
                            }
                        }
                    })
                    .tint(.gray)
                    .padding()
                    .padding(.bottom, 16)
                    
                } // end récurrence
                
                Button {
                    showToast=true
                } label: {
                    Text("Créer l'évènement")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("bleufonce"))
                
            } // end vstack
            
            .overlay{
                if showToast{
                    ZStack{
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.ultraThinMaterial)
                            .frame(width: 300, height: 200)
                        
                        VStack{
                            Text("\(whatEvent) créé le")
                            Text(givenDate, format: Date.FormatStyle().day().month().weekday().hour().minute())
                        }
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color("bleunoir"))
                        .frame(width: 280, height: 200)
                        .multilineTextAlignment(.center)
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            withAnimation {
                                showToast = false
                            }
                        }
                    }
                }
                
                
            } // end vstack
        } // end scroll view
    }
    
    func resetButtons() {
        didTap = false
        didTap1 = false
        didTap2 = false
        didTap3 = false
        didTap4 = false
        didTap5 = false
        didTap6 = false
        didTap7 = false
    }
    
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
                
    }
}
