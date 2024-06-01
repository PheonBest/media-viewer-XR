import SwiftUI

struct MediumControls: View {
    
    @EnvironmentObject var mediaState: MediaState
    @State var isModalPresented: Bool = false
    
    
    var body: some View {
        if let selectedMedium = mediaState.selectedMedium, let mediumPages = selectedMedium.pages?.getData() {
            ZStack {
                VStack(alignment: .trailing) {
                    
                    Spacer()
                    HStack {
                        
                        if self.mediaState.selectedPageIndex != 0 {
                            Button(action:{
                                self.mediaState.selectedPageIndex -= 1
                            }) {
                                Image(systemName: "arrow.left")
                            }
                        }
                        
                        Spacer()
                        
                        if self.mediaState.selectedPageIndex != mediumPages.count-1 {
                            Button(action:{
                                self.mediaState.selectedPageIndex += 1
                            }) {
                                Image(systemName: "arrow.right")
                            }
                        }
                        
                    }
                    .padding(20)
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

#Preview {
    MediumControls().environmentObject(MediaState())
}
