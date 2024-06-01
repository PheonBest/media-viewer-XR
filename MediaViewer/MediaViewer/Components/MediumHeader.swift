import SwiftUI

struct MediumHeader: View {
    @EnvironmentObject var mediaState: MediaState
    
    var body: some View {
        
        if let selectedMedium = mediaState.selectedMedium, let selectedPage = selectedMedium.pages?.getData()[mediaState.selectedPageIndex] {
            Text(selectedPage.title)
                .font(.largeTitle)
                .padding(.top, 40)
                .padding(.bottom, 20)
        }
    }
}

#Preview {
    MediumHeader().environmentObject(MediaState())
}
