import SwiftUI

struct PaintingView: View {
    @EnvironmentObject var paintingData: PaintingModel
    @State var selectedPainting = PaintingModel().paintings[Int.random(in: 0..<PaintingModel().paintings.count)]
    @State var isPopped = false
    @State var isDetailed = false
    @State var isChanging = false
    @State var isAlert = false
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Image(selectedPainting.image)
                        .resizable()
                        .scaledToFit()
                        .border(Color.white, width: 20)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 5)
                        .onTapGesture {
                            isDetailed.toggle()
                        }
                }
                .shadow(radius: 5, x: 0.0, y: 5.0)
                
                
                HStack {
                    Rectangle()
                        .frame(width: 50, height: 10, alignment: .leading)
                        .foregroundStyle(Color.white)
                        .onTapGesture {
                            isPopped.toggle()
                        }
                    
                }
                .shadow(radius: 5, x: 0.0, y: 5.0)
                .popover(isPresented: $isPopped) {
                    VStack {
                        Text(selectedPainting.name)
                            .font(.callout)
                            .bold()
                        Text(selectedPainting.creator)
                            .font(.caption2)
                            .bold()
                            .foregroundStyle(Color.gray)
                    }
                    .padding()
                }
                
            }
            
        }
        .sheet(isPresented: $isDetailed) { [selectedPainting] in
            NavigationStack {
                ZStack {
                    Color.white
                    
                    VStack {
                        PaintingDetailView(painting: selectedPainting, showDescription: $isChanging)
                            .presentationDetents([.medium, .large]) 
                            .presentationBackground(.thinMaterial)
                            .toolbar {
                                ToolbarItem {
                                    Button(action: {
                                        if isChanging {
                                            isAlert = true
                                        } else {
                                            isDetailed.toggle()
                                        }
                                    }, label: {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.black)
                                            .scaleEffect(CGSize(width: 1.2, height: 1.2))
                                    })
                                    .alert(isPresented: $isAlert) {
                                        Alert(title: Text("Set painting first"), dismissButton: .default(Text("Got it!")))
                                    }
                                }
                            }
                            .toolbarBackground(.white, for: .navigationBar, .tabBar)
                            .toolbarBackground(.visible, for: .navigationBar, .tabBar)
   
                        if isChanging {
                            PaintingListView(selectedPainting: $selectedPainting)
                        } 
                        
                        HStack {
                            Button(isChanging ? "Set Painting" : "Change Painting") {
                                isChanging.toggle()
                            }
                            .padding()
                            .foregroundStyle(Color.white)
                            .bold()
                            .background(.black)
                            .clipShape(Capsule())
                            
                            Spacer()
                        }
                        
                        
                        
                                             
                        
                    }
                    .padding(50)
                }
                
                
            }
        
        }
        .padding()
    }        
}
