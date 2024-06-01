import SwiftUI

@main
struct MediaViewerApp: App {
    @StateObject private var areaState = AreaState()
    @StateObject private var mediaState = MediaState()
    @StateObject private var immersiveState = ImmersiveState()
    @StateObject private var earthModel = EarthModel()

    @State private var currentImmersionStyle: ImmersionStyle = .progressive
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some Scene {
        WindowGroup {
            HStack {
                Sidebar()
                    .environmentObject(areaState)
                    .environmentObject(mediaState)
                switch areaState.area {
                case .MEDIA_PICKER:
                    MediaPicker()
                        .environmentObject(areaState)
                        .environmentObject(mediaState)
                case .CONTENT_VIEW:
                    ContentView()
                        .environmentObject(areaState)
                        .environmentObject(mediaState)
                default:
                    MediaPicker()
                        .environmentObject(areaState)
                        .environmentObject(mediaState)
                }
            }
        }
        .environmentObject(immersiveState)
        ImmersiveSpace(id: "preview") {
            if immersiveState.enableImmersiveScene {
                ImmersiveView()
            } else {
                // if url contains "Immersive": load EarthView
                if mediaState.modelType == "NAME" {
                    EarthView()
                        .environmentObject(earthModel)
                } else if let url = mediaState.modelUrl {
                    ThreeDEntity()
                        .environmentObject(mediaState)
                }
            }
            
        }
        .immersionStyle(selection: $immersiveState.immersiveStyle, in: .progressive, .mixed)
    }
}
