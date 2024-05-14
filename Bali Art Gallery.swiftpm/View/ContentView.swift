import SwiftUI

struct ContentView: View {
    @EnvironmentObject var paintingData: PaintingModel
    @EnvironmentObject var musicData: MusicModel
    @ObservedObject var musicPlayer = MusicPlayer()
    @State var showMusicDetail = false
    
    var body: some View {
        ZStack {
            Image("bg-main")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Bali Art Gallery")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(.black)
                        .shadow(color: .yellow, radius: 1)
                        .shadow(radius: 5, x: 0.0, y: 6.0)
                    Text("ᬩᬮᬶᬅᬃᬢ᭄ᬕᬮᬾᬭᬶ")
                        .font(.callout)
                        .bold()
                        .foregroundStyle(.black)
                        .shadow(color: .yellow, radius: 0.5)
                        .shadow(radius: 5, x: 0.0, y: 6.0)
                }
                .scaleEffect(CGSize(width: 1.2, height: 1.2))
                
                
                HStack {
                    PaintingView()
                        .padding()
                    PaintingView()
                        .scaleEffect(CGSize(width: 0.8, height: 0.8))
                        .padding()
                    PaintingView()
                        .padding()
                }
                .scaledToFit()
                .padding() 
            }
            .scaledToFit()
            .padding()
            
            
            VStack {
                Spacer()
                HStack {
                    Image("gamelan")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .padding(.bottom, 60)
                        .shadow(radius: 5, x: 0.0, y: 10.0)
                        .onTapGesture {
                            showMusicDetail.toggle()
                        } 
                }
                .popover(isPresented: $showMusicDetail) {
                    VStack {
                        VStack {
                            Text(musicData.musics[musicPlayer.musicSelection].name)
                                .font(.callout)
                                .bold()
                            Text(musicData.musics[musicPlayer.musicSelection].creator)
                                .font(.caption2)
                                .bold()
                                .foregroundStyle(Color.gray)
                            Text(musicData.musics[musicPlayer.musicSelection].publisher)
                                .font(.caption2)
                                .bold()
                                .foregroundStyle(Color.gray)
                            
                        }
                        
                        HStack {
                            Button(action: {
                                musicPlayer.previous()
                            }) {
                                Image(systemName: "backward")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(musicPlayer.musicSelection == 0 ? Color.gray : Color.yellow)
                            }
                            
                            Button(action: {
                                musicPlayer.playOrPause()
                            }) {
                                Image(systemName: musicPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .foregroundStyle(Color.yellow)
                            }
                            
                            Button(action: {
                                musicPlayer.next()
                            }) {
                                Image(systemName: "forward")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(musicPlayer.musicSelection == musicPlayer.musicData.count - 1 ? Color.gray : Color.yellow)
                            }
                        }
                    }
                    .padding()
                } 
            }
        }
        
        

    }
    
}
