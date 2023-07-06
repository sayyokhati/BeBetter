//
//  ParametreButtonView.swift
//  AppliBeBetter
//
//  Created by Apprenant18 on 04/07/2023.
//

import SwiftUI

struct ParametreButtonView: View {
    var icon: String
    var hauteur: CGFloat
    var largeur: CGFloat
    var texte: String
    
    var body: some View {
        VStack {
                    HStack {
                        Image(systemName: icon)
                            .resizable()
                            .frame(width: largeur, height: hauteur)
                            .padding(.leading, 40)
                            .foregroundColor(Color("bleunoir"))
                        
                        Text(texte)
                            .font(.system(size: 20))
            //                .fontWeight(.semibold)
                            .foregroundColor(Color("bleunoir"))
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .padding(.trailing, 40)
                            .foregroundColor(Color("bleunoir"))
                    }
                    .padding(.bottom, 5)
                }
            }
}

struct ParametreButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ParametreButtonView(icon: "football", hauteur: 40, largeur: 40, texte: "Test")
    }
}
