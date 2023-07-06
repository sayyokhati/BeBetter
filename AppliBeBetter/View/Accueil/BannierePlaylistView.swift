//
//  BannierePlaylistView.swift
//  AppliBeBetter
//
//  Created by Marine Cathala-gil on 29/06/2023.
//

import SwiftUI

struct BannierePlaylistView: View {
    
    @State var music = "Zen"
    
    
    var body: some View {
        
        HStack {
            NavigationLink {
                PlaylistView()
            } label: {
                
                
                VStack {
                    HStack {
                        Text(music)
                            .font(.title)
                            .foregroundColor(Color("bleufonce"))
                        Image(systemName: "music.note")
                            .foregroundColor(Color("bleufonce"))
                        
                    }
                    Text("Dernière")
                    Text("playlist")
                    Text("écoutée")
                    
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

struct BannierePlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        BannierePlaylistView()
    }
}
