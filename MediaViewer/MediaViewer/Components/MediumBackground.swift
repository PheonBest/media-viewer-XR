import SwiftUI

struct MediumBackground: View {
    @EnvironmentObject var mediaState: MediaState

    var body: some View {
        if let selectedMedium = mediaState.selectedMedium, let selectedPage = selectedMedium.pages?.getData()[mediaState.selectedPageIndex] {
            VStack {
                GeometryReader { _ in
                    if let image = selectedPage.backgroundImage {
                        Image(uiImage: image.getData().getImage())
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
            }
        }
    }
}

#Preview {
    MediumBackground().environmentObject(MediaState())
}
