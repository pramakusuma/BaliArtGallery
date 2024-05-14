import SwiftUI

class PaintingModel: ObservableObject {
    @Published var paintings = [
        Painting(name: "Rice Terrace", image: "riceterrace", creator: "I Dewa Nyoman Tjita", description: "A number of people work the rice field with heels, while others drive water buffaloes with a kind of plow. Rice terrace is known as a series of beautifully arranged paddies which follows the traditional Balinese irrigation system called “subak“ (Balinese: ᬲᬸᬩᬓ᭄)."),
        Painting(name: "Cockfighting", image: "cockfighting", creator: "I Ketut Ginarsa", description: "Cockfighting or popularly known as tajen (Balinese: ᬢᬚᭂᬦ᭄), is a tradition that goes back centuries. Some say that it has been around from the tenth century."),
        Painting(name: "Ramayana", image: "ramayana", creator: "I Gusti Nyoman Lempad", description: "Ramayana (Balinese: ᬭᬫᬬᬦ), written in 1975. Kakawin Rāmâyaṇa is a kakawin, the Javanese form of kāvya, a poem modeled on traditional Sanskrit meters.It is believed to have been written in Central Java (modern Indonesia) in approximately the late ninth or early tenth century."),
        Painting(name: "Cremation Ceremony", image: "cremation", creator: "I Ketut Soki", description: "Ngaben (Balinese: ᬗᬩᬾᬦ᭄), also known as Pitra Yadnya, Pelebon or cremation ceremony, is the Hindu funeral ritual of Bali, Indonesia. A Ngaben is performed to release the soul of a dead person so that it can enter the upper realm where it can wait for it to be reborn."),
        Painting(name: "Balinese Temple", image: "balinesetemple", creator: "Raden Ata", description: "A Pura (Balinese: ᬧᬸᬭ) is a Balinese Hindu temple and the place of worship for adherents of Balinese Hinduism in Indonesia. Puras are built following rules, style, guidance, and rituals found in Balinese architecture.")
    ]
}

struct Painting: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var creator: String
    var description: String
}
