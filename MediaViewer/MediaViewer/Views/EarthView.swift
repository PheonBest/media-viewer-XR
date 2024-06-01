//
//  EarthView.swift
//  MediaViewer
//
//  Created by Steffen Büschking on 19.01.24.
//

import Combine
import RealityKit
import RealityKitContent
import SwiftUI

extension Entity {
    struct SubscriptionComponent: Component {
        var subscription: AnyCancellable
    }
}

struct EarthView: View {
    @EnvironmentObject private var earthModel: EarthModel
    @State private var earth: Entity = .init()
    
    var body: some View {
RealityView { content, attachments in
    if let globe = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
        content.add(globe)
        earth = globe
    }

    if let dialogAttachment = attachments.entity(for: "dialog") {
        let position = dialogAttachment.convert(position: SIMD3<Float>(0.5, 0.75, -0.5), to: earth)
        dialogAttachment.position = position
        earth.addChild(dialogAttachment)
    }
    
} attachments: {
    Attachment(id: "dialog") {
        LocationDialogView()
    }
}
        .gesture(TapGesture().targetedToAnyEntity().onEnded { value in
            let entity = value.entity
            
            switch entity.name {
                case "marker_germany":
                    if !earthModel.isOpened {
                        earthModel.isOpened = true
                    }
                    
                    earthModel.header = "Germany"
                    earthModel.content =
                        """
                            Germany's climate is temperate and marine, characterized by cool, wet winters and mild, humid summers. It is influenced by the North Atlantic Drift, which moderates the climate and makes it milder than it would otherwise be at its latitude. However, there are regional variations in climate across Germany due to its diverse geography that ranges from the North Sea coast in the north to the Bavarian Alps in the south.
                        """
                    break
                case "marker_france":
                    if !earthModel.isOpened {
                        earthModel.isOpened = true
                    }
                
                    earthModel.header = "France"
                    earthModel.content =
                        """
                            France's climate is diverse, influenced by its geographical location between the Atlantic Ocean, the Mediterranean Sea, and continental Europe.
                        """
                    break
                case "marker_spain":
                    if !earthModel.isOpened {
                        earthModel.isOpened = true
                    }
                
                    earthModel.header = "Spain"
                    earthModel.content =
                        """
                            Spain's climate is diverse due to its geographic situation between the Atlantic Ocean and the Mediterranean Sea, along with its varied topography including mountains, plateaus, and coastlines.
                        """
                    break
                case "marker_south_africa":
                    if !earthModel.isOpened {
                        earthModel.isOpened = true
                    }
                
                    earthModel.header = "South Africa"
                    earthModel.content =
                        """
                            South Africa's climate is predominantly semi-arid but varies considerably across different regions due to its diverse topography and oceanic influence.
                        """
                case "marker_usa":
                    if !earthModel.isOpened {
                        earthModel.isOpened = true
                    }
                
                    earthModel.header = "USA"
                    earthModel.content =
                        """
                            The United States boasts a wide array of climate zones, reflecting its vast geography that spans from the Atlantic to the Pacific Ocean, and from the tropical regions of Hawaii and Florida to the Arctic zone of Alaska.
                        """
                    break
                case "marker_brazil":
                    if !earthModel.isOpened {
                        earthModel.isOpened = true
                    }
                
                    earthModel.header = "Brazil"
                    earthModel.content =
                        """
                            Brazil's climate is as varied as its vast territory, encompassing several distinct climatic regions due to its large size, varying elevations, and its positioning across the equator.
                        """
                case "marker_india":
                    if !earthModel.isOpened {
                        earthModel.isOpened = true
                    }
                
                    earthModel.header = "India"
                    earthModel.content =
                        """
                            India's climate is dominated by the monsoon, featuring a wide range of weather conditions across its vast geographical expanse, which includes the Himalayan mountains in the north, the Thar Desert in the west, and the coastal regions by the Indian Ocean in the south.
                        """
                default:
                    var transform = value.entity.transform
                    transform.rotation *= simd_quatf(angle: .pi / 4, axis: SIMD3<Float>(0, 1, 0))
            
                    value.entity.move(to: transform, relativeTo: value.entity.parent!, duration: 1, timingFunction: .linear)
                
            }
        })
        .highPriorityGesture(TapGesture(count: 2).targetedToEntity(earth).onEnded { value in
            var transform = value.entity.transform
            transform.rotation *= simd_quatf(angle: -(.pi / 4), axis: SIMD3<Float>(0, 1, 0))
            
            value.entity.move(to: transform, relativeTo: value.entity.parent!, duration: 1, timingFunction: .linear)
        })
        .gesture(DragGesture().targetedToEntity(earth).onChanged { value in
            value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
        })
    }
}

#Preview {
    EarthView()
        .previewLayout(.sizeThatFits)
}
