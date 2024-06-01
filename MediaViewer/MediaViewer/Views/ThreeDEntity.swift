import RealityKit
import RealityKitContent
import SwiftUI

struct ThreeDEntity: View {
    @EnvironmentObject var mediaState: MediaState

    var body: some View {
        RealityView { content in

            if mediaState.modelType == "URL", let url = mediaState.modelUrl {
                // Load entity from URL
                do {
                    let model = try await Entity(contentsOf: url)
                    // place behind the screen window
                    let anchor = AnchorEntity(world: [0, 0, -1])
                    anchor.addChild(model)
                    anchor.scale = [0.4, 0.4, 0.4]
                    content.add(anchor)

                    if model.availableAnimations.count > 0 {
                        model.playAnimation(model.availableAnimations.first!.repeat())
                    }
                } catch {
                    print("Failed loading entity.")
                }
            } else {
                print("Failed loading 3D entity: No URL defined!")
            }
        }
        .id(mediaState.modelUrl) // Force update on model change
    }
}

#Preview {
    ThreeDEntity().environmentObject(MediaState())
}
