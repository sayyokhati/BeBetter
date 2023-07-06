//
//  PraticienDetailView.swift
//  BeBetter
//
//  Created by apprenant62 on 19/06/2023.
//

import SwiftUI

struct PraticienDetailView: View {
    
    @State private var didTap : Bool = false
    @State private var didTap1 : Bool = false
    @State private var didTap2 : Bool = false
    @State private var didTap3 : Bool = false
    @State private var didTap4 : Bool = false
    @State private var didTap5 : Bool = false
    @State private var didTap6 : Bool = false
    @State private var didTap7 : Bool = false
    
    @State private var isSelected : Bool = false

    
    var praticienDetail : Praticien
    
    @State private var selectedPlace = "Localisaton"
    
    let place = ["Au travail", "Au cabinet", "A la salle de sport"]
    
    @State private var validerLeCreneau : Bool = false
    @State private var showToast: Bool = false

    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Image(praticienDetail.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding(.bottom, 8)
                
                
                Text(praticienDetail.name)
                    .bold()
                    .font(.title3)
                    .foregroundColor(Color("bleunoir"))
                
                Text(praticienDetail.job.rawValue)
                    .foregroundColor(Color("bleunoir"))

                
                Text(praticienDetail.jobDescription)
                    .padding()
                    .font(.subheadline)
                    .padding(.bottom, 8)
                    .foregroundColor(Color("bleunoir"))

                
                Text("Réserver un créneau")
                    .bold()
                    .padding(.bottom, 8)
                    .foregroundColor(Color("bleunoir"))

                
                HStack {
                    
                    Button {
                        resetButtons()
                        self.didTap = true
                    } label: {
                        Text("12:00")
                    }
                    .background(didTap ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
//                    .disabled(didTap1 == false && didTap2 == false && self.didTap3 == true && self.didTap4 == true && self.didTap5 == true && self.didTap6 == true && self.didTap7 == true && self.didTap8 == true)
//
//                  
                    
                    Button {
                        resetButtons()
                        self.didTap1 = true
                    } label: {
                        Text("12:30")
                    }
                    .background(didTap1 ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    .disabled(didTap == true || didTap2 == true )

                    Button {
                        resetButtons()
                        self.didTap2 = true
                    } label: {
                        Text("13:00")
                    }
                    .background(didTap2 ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    
                    
                    Button {
                        resetButtons()
                        self.didTap3 = true
                    } label: {
                        Text("13:30")
                    }
                    .background(didTap3 ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    
                    
                } // end hstack
                
                HStack {
                    Button {
                        resetButtons()
                        self.didTap4 = true
                    } label: {
                        Text("14:00")
                    }
                    .background(didTap4 ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    
                    
                    Button {
                        resetButtons()
                        self.didTap5 = true
                    } label: {
                        Text("14:30")
                    }
                    .background(didTap5 ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    
                    Button {
                        resetButtons()
                        self.didTap6 = true
                    } label: {
                        Text("15:00")
                    }
                    .background(didTap6 ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    
                    
                    Button {
                        resetButtons()
                        self.didTap7 = true
                    } label: {
                        Text("15:30")
                    }
                    .background(didTap7 ? Color("bleufonce") : Color("bleu"))
                    .foregroundColor(Color("bleunoir"))
                    .buttonStyle(.bordered)
                    .cornerRadius(6)
                    
                    
                } // end hstack
                .padding(.bottom, 16)
                
                
                
              
                Text("Choisir la localisation")
                    .bold()
                    .padding(.bottom, 8)
                    .foregroundColor(Color("bleunoir"))

                
                
                DisclosureGroup(selectedPlace, content: {
                    ForEach(place, id: \.self) { place in
                        Button(action: {
                            selectedPlace = place
                        }) {
                            Text(place)
                                .padding(.bottom, 6)
                        }
                    }
                })
                .tint(.gray)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.bottom, 16)
                
                
                
                Button {
                    showToast=true
                } label: {
                    Text("Valider le créneau")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.borderedProminent)
                .tint((Color("bleufonce")))
                
                
            } // end vstack
            
            .overlay{
                if showToast{
                    ZStack{
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(.ultraThinMaterial)
                            .frame(width: 300, height: 200)
                        
                        VStack{
     
                            Text("Rendez-vous pris à 13h30 avec \(praticienDetail.name) \(selectedPlace)")
                                .font(.body)
                                .fontWeight(.bold)
                                .foregroundColor((Color("bleunoir")))
                                .frame(width: 280, height: 200)
                                .multilineTextAlignment(.center)
                            
                            
                        }
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            withAnimation {
                                showToast = false
                            }
                        }
                    }
                }
            } // end overlay
            
            
            
            
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

struct PraticienDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PraticienDetailView(praticienDetail: ChloeDelarue)
    }
}

