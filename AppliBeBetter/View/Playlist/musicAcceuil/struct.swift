//
//  struct.swift
//  AppliBeBetter
//
//  Created by Sharik Mohamed on 30/06/2023.
//
import SwiftUI
import AVKit

class AudioPlayer: ObservableObject {
    @Published var isPlaying = false
    
    
    private var player: AVAudioPlayer?
    
    func playAudio(name : String ) {
        
        guard let url = Bundle.main.url(forResource: name , withExtension: "mp3") else {
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            isPlaying = true
        } catch {
            print("Erreur")
        }
    }
    
    func pauseAudio() {
        player?.pause()
        isPlaying = false
    }
    
    func seek(to time: Double) {
        player?.currentTime = time
    }
    func formattedTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
  

