//
//  BanniereCompteurPasView.swift
//  AppliBeBetter
//
//  Created by Marine Cathala-gil on 29/06/2023.
//

import SwiftUI

struct BanniereCompteurPasView: View {
    
    @EnvironmentObject var vm: HealthKitViewModel
    var stepCount: LocalizedStringKey
    
    
    var body: some View {
        HStack {
            NavigationLink {
                StepAutorizationView()
            } label: {
                
                
                VStack {
                    HStack {
                        Text(stepCount)
                            .foregroundColor(Color("bleufonce"))
                            .font(.title)
                        Image("foot")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Text("Nombre")
                    Text("de")
                    Text("pas")
                    
                }
                .padding()
                .foregroundColor(.black)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(Color("bleu"))
                )
            }
        }
        }
    }

struct BanniereCompeturPasView_Previews: PreviewProvider {
    static var previews: some View {
        BanniereCompteurPasView(stepCount:"Aucune donnees")
            .environmentObject(HealthKitViewModel())
        
    }
}
