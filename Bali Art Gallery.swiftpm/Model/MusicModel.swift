import SwiftUI

class MusicModel: ObservableObject {
    @Published var musics = [
        Music(name: "Tabuh Telu", music: "tabuhtelu", creator: "I Gusti Made Kecog", publisher: "Aneka Record"),
        Music(name: "Sekar Jepun", music: "sekarjepun", creator: "I Gusti Made Kecog", publisher: "Aneka Record")
    ]
}

struct Music: Identifiable {
    var id = UUID()
    var name: String
    var music: String
    var creator: String
    var publisher: String
}
