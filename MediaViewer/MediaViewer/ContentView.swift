import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mediaState: MediaState

    var body: some View {
        ZStack {
            if let medium = mediaState.selectedMedium {
                if medium.pages?.getData().indices.contains(mediaState.selectedPageIndex) == true {
                    MediumBackground()
                    MediumContainer().padding(40)
                    MediumControls()
                } else {
                    Text("The selected medium doesn't contain any pages")
                }
            } else {
                Text("Please select a medium")
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView().environmentObject(AreaState()).environmentObject(MediaState())
}
