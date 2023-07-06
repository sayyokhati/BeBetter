//
//  cat4view.swift
//  AppliBeBetter
//
//  Created by Sharik Mohamed on 01/07/2023.
//

import SwiftUI

struct cat4view: View {
    @State private var isPlaying = false
    @StateObject var audioPlayer = AudioPlayer()
    @State private var showModal = false
    @State private var selectedListeacceuil: Listeacceuil? = nil
    var body: some View {
        NavigationStack{
            VStack{
                Image("dynamique")
                    .resizable()
                    .cornerRadius(8)
                
                
                    .frame(width: 150, height: 150)
                Text("Dynamique")
                    .foregroundColor(Color("bleunoir"))
                
                ScrollView {
                    ForEach(listeaccuils){ listeacceuil in
                        VStack() {
                            
                            Button(action: {
                                withAnimation {
                                    selectedListeacceuil = listeacceuil
                                    showModal = true
                                }
                                
                            }) {
                                extramusic(listaceuil: listeacceuil)
                                
                            }
                            
                            
                            
                        }
                        
                        
                        
                    }
                }
                .padding(.top, 20.0)
                Spacer()    }
            
            .overlay(alignment: .bottom) {
                modelplaylist(audioPlayer: audioPlayer, listaceuil: selectedListeacceuil)
                    .frame(height: 70)
                    .offset(y: selectedListeacceuil == nil ? 100 : 0 )
            }}
    }
}
            
            
        
