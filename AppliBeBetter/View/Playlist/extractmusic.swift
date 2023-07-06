//
//  extractmusic.swift
//  AppliBeBetter
//
//  Created by Apprenant 26 on 27/06/2023.
//

import SwiftUI

struct extramusic: View {
    
    
    @State private var isPlaying = false
    var listaceuil: Listeacceuil
    var body: some View {
      //  HStack{
            
           
                
                

          //  ZStack(alignment: .leading){
//                RoundedRectangle(cornerRadius: 8 )
//                    .padding(.top, 50.0)
//                    .foregroundColor(.white)
//                    .frame(width: 350.0, height: 80.0)
//                    . overlay(
//
//                        RoundedRectangle(cornerRadius: 8)
//                            .inset(by: 0.5)
//                            .stroke(Color(red: 0.31, green: 0.7, blue: 0.78), lineWidth: 1)
                 //   )
                HStack{
                    Image(listaceuil.image)
                        .resizable()
                        .cornerRadius(10)
                    
                    
                        .frame(width: 35, height: 35)
                    HStack{
                        Text(listaceuil.name)
                        
                            .foregroundColor(Color("bleunoir"))
Spacer()
                        Text(listaceuil.duration)
                            .foregroundColor(Color("bleunoir"))
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing)
                        
                    }}
                .padding()
                .frame(width: 350.0, height: 60.0)
                .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color("bleufonce"), lineWidth: 1))
                
                
                
            }
      //  }
    }

