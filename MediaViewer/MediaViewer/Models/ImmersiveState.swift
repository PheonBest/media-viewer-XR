//
//  ImmersiveState.swift
//  MediaViewer
//
//  Created by Steffen Büschking on 08.02.24.
//

import Foundation
import SwiftUI

class ImmersiveState: ObservableObject {
    @Published var enableImmersiveScene: Bool = false
    @Published var immersiveStyle: ImmersionStyle = .mixed
}
