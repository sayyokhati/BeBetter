//
//  BanniereProfilView.swift
//  AppliBeBetter
//
//  Created by Marine Cathala-gil on 23/06/2023.
//

import SwiftUI

struct BanniereProfilView: View {
    
    @ObservedObject var profile: Profile

    
    var name : String = "Karine"
    var imageProfil : String = "Karine"
    var bienvenue : String = "Bonjour"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color("bleufonce"))
                .edgesIgnoringSafeArea(.all)
                .frame(width: 350, height: 100)
            
            
            
            HStack {
                
                Image(imageProfil)
                    .resizable()
                    .clipShape(Circle())
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.trailing,30)
                
                VStack (alignment: .leading) {
                    Text(bienvenue)
                        .font(.title3)
                        .foregroundColor(Color("bleunoir"))
                    Text(profile.myName)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("bleunoir"))
                }
                .padding(.trailing, 30)
            }
        }
    }
}

struct BanniereProfilView_Previews: PreviewProvider {
    static var previews: some View {
        BanniereProfilView(profile: profiles[0])
    }
}
