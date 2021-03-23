//
//  File.swift
//  The Quiz
//
//  Created by Nick on 23.03.2021.
//

import AVFoundation


/// Class for control the Background Music Status
class Music {
    static let sharedInstance = Music()
    private var player: AVAudioPlayer?
    
    //Turn On the Background Music
    func play() {
        guard let url = Bundle.main.url(forResource: "musicTheme", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.soloAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            player?.numberOfLoops = -1
            guard let player = player else { return }
            player.volume = 0.1
            player.play()
            
        } catch { print("Background Music is not found") }
    }
    
    //Stop the Background Music
    func stop() {
        player?.stop()
    }
}
