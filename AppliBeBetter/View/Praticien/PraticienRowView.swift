//
//  PraticienRowView.swift
//  BeBetter
//
//  Created by apprenant62 on 21/06/2023.
//

import SwiftUI

struct PraticienRowView: View {
    
    var PraticienRow: Praticien
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image("\(PraticienRow.image)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                
                VStack (alignment: .leading) {
                    Text("\(PraticienRow.name)")
                        .bold()
                        .foregroundColor(Color("bleunoir"))

                    Text("\(PraticienRow.job.rawValue)")
                        .foregroundColor(Color("bleunoir"))

                } // end vstack text
            } // end hstack
        } // end vstack
        
    }
}

struct PraticienRowView_Previews: PreviewProvider {
    static var previews: some View {
        PraticienRowView(PraticienRow: ChloeDelarue)
    }
}
