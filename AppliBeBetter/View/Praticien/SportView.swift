//
//  SportView.swift
//  BeBetter
//
//  Created by apprenant62 on 21/06/2023.
//

import SwiftUI

struct SportView: View {
    
    var arrayOfPraticien : [Praticien] = tabOfSport

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

struct SportView_Previews: PreviewProvider {
    static var previews: some View {
        SportView()
    }
}
