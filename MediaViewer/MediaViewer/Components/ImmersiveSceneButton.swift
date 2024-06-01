//
//  ImmersiveSceneButton.swift
//  MediaViewer
//
//  Created by Steffen Büschking on 08.02.24.
//

import SwiftUI

struct ImmersiveSceneButton: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @EnvironmentObject var immersiveState: ImmersiveState
    var body: some View {
        Button(action: {
            Task {
                immersiveState.enableImmersiveScene = !immersiveState.enableImmersiveScene
                if immersiveState.enableImmersiveScene {
                    immersiveState.immersiveStyle = .progressive
                    await openImmersiveSpace(id: "preview")
                } else {
                    immersiveState.immersiveStyle = .mixed
                    await dismissImmersiveSpace()
                }
            }
            
        }) {
            Text("Immersive")
            Image(systemName: immersiveState.enableImmersiveScene ? "checkmark.circle" : "multiply.circle")
        }
    }
}

#Preview {
    ImmersiveSceneButton()
}
