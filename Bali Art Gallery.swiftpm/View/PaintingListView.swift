import SwiftUI

struct PaintingListView: View {
    @EnvironmentObject var paintingData: PaintingModel
    @Binding var selectedPainting: Painting
    
    var body: some View {
        ScrollView(.horizontal) { 
            HStack {
                ForEach(paintingData.paintings) { painting in
                    Image(painting.image)
                        .resizable()
                        .scaledToFit()
                        .border(.black, width: selectedPainting.image == painting.image ? 3 : 0)
                        .onTapGesture {
                            self.selectedPainting = painting
                        }                          
                    
                } 
            }
            .scrollTargetLayout()
            
        }
        .frame(height: 100)
        .scrollTargetBehavior(.viewAligned)
    }
}
