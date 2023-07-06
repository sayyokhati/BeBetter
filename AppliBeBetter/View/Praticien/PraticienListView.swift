//
//  PraticienListView.swift
//  BeBetter
//
//  Created by apprenant62 on 20/06/2023.
//

import SwiftUI

struct PraticienListView: View {
    
    @State var textToSearch = ""

    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("Liste praticiens")
                    .font(.system(size: 25))
                    .padding(.bottom, 8)
                    .bold()
                    .foregroundColor(Color("bleunoir"))

                
                VStack (alignment: .leading) {
                    
                    Text("Bien-être")
                        .font(.headline)
                        .padding(.leading, 20)
                        .foregroundColor(Color("bleufonce"))

                    
                    HStack(alignment: .center) {
                        
                        ForEach(ostéopathe) { praticien in
                            
                            NavigationLink {
                                WellnessView()
                            } label: {
                                Image("Bien-être")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(6)
                                    .frame(width: 345, height: 140, alignment: .center)
                                
                                
                            }
                        }
                    } // end hstack
                    .padding()
                    .frame(height: 140)
                    
                    Text("Réserver un massage sur mon lieu de travail.")
                        .font(.subheadline)
                        .padding(.bottom, 16)
                        .padding(.leading, 20)
                        .foregroundColor(Color("bleunoir"))

                    
                } // end vstack bien être
                
                
                VStack (alignment: .leading) {
                    
                    Text("Santé")
                        .font(.headline)
                    //                        .padding(.bottom, 8)
                        .padding(.leading, 20)
                        .foregroundColor(Color("bleufonce"))

                    
                    HStack(alignment: .center) {
                        
                        ForEach(ostéopathe) { praticien in
                            
                            NavigationLink {
                                HealthView()
                            } label: {
                                Image("Santé")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(6)
                                    .frame(width: 345, height: 140, alignment: .center)
                                
                            }
                        }
                    } // end hstack
                    .padding()
                    .frame(height: 140)

                    Text("Rencontrer une sophrologue")
                        .font(.subheadline)
                        .padding(.bottom, 16)
                        .padding(.leading, 20)
                        .foregroundColor(Color("bleunoir"))

                    
                } // end vstack santé
                
                
                
                VStack (alignment: .leading) {
                    
                    Text("Sport")
                        .font(.headline)
                    //                        .padding(.bottom, 8)
                        .padding(.leading, 20)
                        .foregroundColor(Color("bleufonce"))

                    
                    HStack(alignment: .center) {
                        
                        ForEach(ostéopathe) { praticien in
                            
                            NavigationLink {
                                SportView()
                            } label: {
                                Image("Sport")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(6)
                                    .frame(width: 345, height: 140, alignment: .center)
                                
                                
                            }
                        }
                    } // end hstack
                    .padding()
                    .frame(height: 140)
                    
                    Text("Réserver un cours d’escalade")
                        .font(.subheadline)
                        .padding(.bottom, 16)
                        .padding(.leading, 20)
                        .foregroundColor(Color("bleunoir"))

                    
                } // end vstack sport
                
                
            } // end vstack
            .searchable(text: $textToSearch, placement: .navigationBarDrawer(displayMode: .always), prompt: "Chercher un praticien, une spécialité...")
      
        } // end scrollview

    }
    
    func searchPraticien() -> [Praticien] {
        
        if textToSearch.isEmpty {
            return allPraticien
        } else {
            return allPraticien.filter { $0.name.contains(textToSearch) || $0.jobDescription.contains(textToSearch) }
        }
    }
    
    
}

struct PraticienListView_Previews: PreviewProvider {
    static var previews: some View {
        PraticienListView()
    }
}


