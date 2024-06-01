import SwiftUI

struct MediumContent: View {
    @EnvironmentObject var mediaState: MediaState

    @ViewBuilder
    var body: some View {
        if let selectedMedium = mediaState.selectedMedium, let selectedPage = selectedMedium.pages?.getData()[mediaState.selectedPageIndex] {
            RichText(richTextNodes: selectedPage.content)
                .padding(40)
                .font(.system(size: 20))
                .multilineTextAlignment(.leading)
                .frame(maxHeight: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    MediumContent().environmentObject(MediaState())
}
