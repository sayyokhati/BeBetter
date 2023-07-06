//
//  PlaylistView.swift
//  api
//
//  Created by Apprenant 26 on 22/06/2023.
//

import SwiftUI

struct PlaylistView: View {
    @State private var isPlaying = false
    @StateObject var audioPlayer = AudioPlayer()
    @State private var showModal = false
    @State private var selectedListeacceuil: Listeacceuil? = nil
    var body: some View {
        NavigationView {
            ScrollView {
            VStack{
                Text("Playlist")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("bleunoir"))
                 
                    .padding(.all, 10.0)
                    .padding()
            
                
               
                    HStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 14.0, height: 10.0)
                       
                        Text("Catégorie")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("bleufonce"))
                        Spacer()
                    }
                ScrollView(.horizontal){
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 6.0, height: 2.0)
                    HStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 14.0, height: 10.0)
                        NavigationLink {
                            Cat1view()
                            
                        } label: {
                            ExtractedView( img:"mood1", txt:"Motivation")
                        }
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 6.0, height: 10.0)
                        NavigationLink {
                            Cat2view()
                        } label: {
                            ExtractedView( img:"palmier", txt:"Relaxation")
                        }
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 6.0, height: 10.0)
                        NavigationLink {
                            cat3view()
                        } label: {
                            ExtractedView( img:"Concentration", txt:" Concentration")
                        }
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 6.0, height: 10.0)
                        NavigationLink {
                            cat4view()
                        } label: {
                            ExtractedView( img:"dynamique", txt:" Dynamique")
                        }
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(.top, -10.0)
                .scrollIndicators(.hidden)
                
                HStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 14.0, height: 10.0)
                    
                    Text("Son d'ambiance")
                    
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("bleufonce"))
                        .bold()
                    Spacer()
                }
                .padding(.top, 40.0)
               
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
                .padding(.top, 10.0)
                Spacer()    }
            .scrollIndicators(.hidden)
        
        .overlay(alignment: .bottom) {
            modelplaylist(audioPlayer: audioPlayer, listaceuil: selectedListeacceuil)
                .frame(height: 70)
                .offset(y: selectedListeacceuil == nil ? 100 : 0 )
        }}
    }
    }
    



struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView()
    }
}

struct ExtractedView: View {
    var img : String
    var txt : String
    var body: some View {
        VStack{
            Rectangle()
                .cornerRadius(10)
                .padding(30.0)
                .foregroundColor(.clear)
                .frame(width: 150, height: 150)
                .background(
                    
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        
                        .cornerRadius(8))
            Text(txt)
                .font(Font.custom("Inter", size: 17))
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
        }
    }
}

