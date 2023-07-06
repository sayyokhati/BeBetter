//
//  CompteurPasView.swift
//  EssaiCalendar
//
//  Created by Marine Cathala-gil on 26/06/2023.
//

import SwiftUI
import Charts

struct ToyShape: Identifiable {
    var type: String
    var count: Double
    var id = UUID()
}



struct CompteurPasView: View {
    
    @EnvironmentObject var vm: HealthKitViewModel

    var body: some View {
        
        
        VStack {
            Spacer()
            
            VStack {
                BanniereProfilView(profile: profiles[0], imageProfil: "blackfoot", bienvenue: "Félicitations ! ")
            }
            .padding(.bottom, 100)
            
            Text("Nombres de pas")
                .font(.title2)
                .bold()
            Text("de la semaine")
                .font(.title2)
                .bold()
            
            
            Chart(vm.previousWeekCount) { shape in
                BarMark(x: .value("Shape Type", shape.type),
                        y: .value("Total Count", shape.count)
                )

                //                .foregroundStyle(by: .value("Shape Color", shape.color))
                
                
                
            }
            .foregroundColor(Color("bleufonce"))
            .frame(height: 300)
            .padding()
            Spacer()
        }
    }
    
    
}


struct CompteurPasView_Previews: PreviewProvider {
    static var previews: some View {
        CompteurPasView().environmentObject(HealthKitViewModel())
    }
}
