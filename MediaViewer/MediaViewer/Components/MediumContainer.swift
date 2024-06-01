import SwiftUI

struct MediumContainer: View {
    @EnvironmentObject var mediaState: MediaState

    var body: some View {
        ScrollView(showsIndicators: true) {
            VStack(alignment: .leading) {
                MediumHeader()
                MediumContent()
                Spacer(minLength: 0)
            }
        }.id(mediaState.selectedPageIndex) // Force recreation when selectedPageIndex changes
            .padding(20)
            .background(Color.black.opacity(0.5))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MediumContainer().environmentObject(MediaState())
}
