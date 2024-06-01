//
//  ImmersiveView.swift
//  MediaViewer
//
//  Created by Steffen Büschking on 08.02.24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            /* Create sphere around user for immersive space experience (sourced from DestionationVideo project by Apple https://developer.apple.com/documentation/visionos/destination-video, last access 31.01.2024) */
            let immersiveSphere = Entity()
            
            let subscription = TextureResource.loadAsync(named: "beach_scene", in: .main).sink(
                receiveCompletion: { state in
                    switch state {
                    case .finished: print("finished")
                    case .failure(let error): print(error)
                    }
                },
                receiveValue: { texture in
                    var material = UnlitMaterial()
                    material.color = .init(texture: .init(texture))
                    immersiveSphere.components.set(ModelComponent(mesh: .generateSphere(radius: 1E3), materials: [material]))
                    immersiveSphere.scale *= .init(x: -1, y: 1, z: 1)
                    immersiveSphere.transform.translation += SIMD3<Float>(0.0, 1.0, 0.0)
                }
            )
            
            immersiveSphere.components.set(Entity.SubscriptionComponent(subscription: subscription))
            
            content.add(immersiveSphere)
        }
        
    }
}

#Preview {
    ImmersiveView()
}
