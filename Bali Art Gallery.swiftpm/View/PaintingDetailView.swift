import SwiftUI

struct PaintingDetailView: View {
    var painting: Painting
    @Binding var showDescription: Bool
    
    var body: some View {
        VStack {
            VStack {
                Image(painting.image)
                    .resizable()
                    .scaledToFit()

                VStack {
                    HStack {
                        Text(painting.name)
                            .font(.largeTitle)
                            .foregroundStyle(Color.black)
                            .bold()
                        Spacer()
                    }
                    HStack {
                        Text(painting.creator)
                            .font(.headline)
                            .foregroundStyle(Color.gray)
                            .bold()
                            .padding(.bottom)
                        Spacer()
                    }
                    if !showDescription {
                        HStack {
                            Text(painting.description)
                                .font(.headline)
                                .foregroundStyle(Color.black)
                            Spacer()
                        }
                    }
                    
                    
                }

            }
            .padding(.bottom)
        }
        
    }
}

