//
//  WellnessView.swift
//  BeBetter
//
//  Created by apprenant62 on 21/06/2023.
//

import SwiftUI

struct WellnessView: View {
    
    var arrayOfPraticien : [Praticien] = tabOfWellness
    
    var body: some View {
                    
            VStack {
                
                List {
                    
                    ForEach(arrayOfPraticien) { praticien in
                        NavigationLink {
                            PraticienDetailView(praticienDetail: praticien)
                        } label: {
                            PraticienRowView(PraticienRow: praticien)
                        }
                    }
                    
                    
                } // end list
                
            } // end vstack
                }
}

struct WellnessView_Previews: PreviewProvider {
    static var previews: some View {
        WellnessView()
    }
}
