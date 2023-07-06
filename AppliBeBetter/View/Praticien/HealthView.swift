//
//  HealthView.swift
//  BeBetter
//
//  Created by apprenant62 on 21/06/2023.
//

import SwiftUI

struct HealthView: View {
    
    var arrayOfPraticien : [Praticien] = tabOfHealth
    
    var body: some View {
        
//        NavigationView {
            
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
            
//        } // end nav view
        
        
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
