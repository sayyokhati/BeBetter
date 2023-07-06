//
//  modelplaylist.swift
//  AppliBeBetter
//
//  Created by Sharik Mohamed on 02/07/2023.
//

import SwiftUI

struct modelplaylist: View {
    @ObservedObject var audioPlayer : AudioPlayer
    @State private var progress: Float = 0.0
    var listaceuil: Listeacceuil?
    
    func formattedTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    var body: some View {
        VStack {
         
            if let listaceuil{
                
                
                
                
                HStack {
                    
                    
                    Rectangle()
                        .foregroundColor(Color("bleu"))
                        .frame(width: 10.0, height: 10.0)
                    Image(listaceuil.image)
                        .resizable()
                        .cornerRadius(8)
                        .frame(width: 50, height: 50)
                    
                    Text(listaceuil.name)
                        .font(.subheadline)
                        .foregroundColor(Color("bleunoir"))
                        .fontWeight(.regular)
                    Spacer()
                    
                    Button(action: {}) {
                        MediaPlayerView(audioPlayer: audioPlayer, listacceuil: listaceuil)
                    }
                    Rectangle()
                        .foregroundColor(Color("bleu"))
                        .frame(width: 10.0, height: 10.0)
                }
                
//                Slider(value: Binding(get: {
//                    self.progress
//                }, set: { newValue in
//                    self.progress = newValue
//                    let time = Double(progress) * listaceuil.duration
//                    audioPlayer.seek(to: time)
//                    
//                }))
//                .padding(.horizontal)
                
                
                
                
                
                
                
                
                
                
                
            }
        }
        .padding(.vertical, 8)
            .background(Color("bleu"))
        }
    }
    


