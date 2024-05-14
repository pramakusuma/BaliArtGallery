import SwiftUI

@main
struct MyApp: App {
    @StateObject var paintingData = PaintingModel()
    @StateObject var musicData = MusicModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
               
        }
         .environmentObject(paintingData)
         .environmentObject(musicData)
    }
}
