import Foundation
import AVFoundation

class MusicPlayer: ObservableObject {
    var audioPlayer: AVAudioPlayer!
    var musicData = MusicModel().musics
    @Published var musicSelection = 0
    var timeAtPause: Double = 0
    @Published var isPlaying = false
    
    init() {
        setMusic()
    }
    
    func setMusic() {
        if let path = Bundle.main.path(forResource: musicData[musicSelection].music, ofType: "wav") {
            do {
                _ = try? AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: .default)
                _ = try? AVAudioSession.sharedInstance().setActive(true)
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer.numberOfLoops = -1
            } catch let error {
                print("Error playing music: \(error.localizedDescription)")
            }
        }

    }
    
    func playOrPause() {
        
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            isPlaying = false
        } else {
            audioPlayer.play()
            isPlaying = true
        }
    }
    
    func next() {
        audioPlayer.stop()
        if musicSelection != musicData.count-1 {
            musicSelection += 1
            setMusic()
            audioPlayer.play()
            isPlaying = true
        } else {
            audioPlayer.play()
        }
    }
    
    func previous() {
        audioPlayer.stop()
        if musicSelection != 0 {
            musicSelection -= 1
            setMusic()
            audioPlayer.play()
            isPlaying = true
        } else {
            audioPlayer.play()
        }
    }
    

    

    
}
