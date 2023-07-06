//
//  MediaplayerView.swift
//  AppliBeBetter
//
//  Created by Sharik Mohamed on 30/06/2023.
//
import SwiftUI

struct MediaPlayerView: View {
    @ObservedObject var audioPlayer : AudioPlayer
    @State private var currentSongIndex = 0
    @State private var progress: CGFloat = 0.0
    var listacceuil : Listeacceuil
    
    var body: some View {
        VStack {
            Button(action: {
                if audioPlayer.isPlaying {
                    audioPlayer.pauseAudio()
                } else {
                    audioPlayer.playAudio(name: listacceuil.music)
                }
            }) {
                Image(systemName: audioPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .foregroundColor(Color("bleufonce"))
            }
        }
    }
}

