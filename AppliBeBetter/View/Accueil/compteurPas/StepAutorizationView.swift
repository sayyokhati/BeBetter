//
//  CompteurPasBisView.swift
//  EssaiCalendar
//
//  Created by Marine Cathala-gil on 27/06/2023.
//

import SwiftUI

struct StepAutorizationView: View {
    @EnvironmentObject var vm: HealthKitViewModel
    
    var body: some View {
        VStack {
            if vm.isAuthorized {
               
                CompteurPasView()
                
            } else {
                VStack {
                    Text("Autorisez-vous l'application")
                        .font(.title3)
                    Text("à utiliser votre compteur de pas ?")
                        .font(.title3)
                    Text("HealthKit")
                        .font(.title3)

                    
                    Button {
                        vm.healthRequest()
                    } label: {
                        Text("J' autorise !")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 320, height: 55)
                    .background(Color("bleufonce"))
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .onAppear {
            vm.healthRequest()
        }
            }
    
}


struct CompteurPasBisView_Previews: PreviewProvider {
    static var previews: some View {
        StepAutorizationView().environmentObject(HealthKitViewModel())
    }
}
