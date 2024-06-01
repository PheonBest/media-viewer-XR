//
//  EarthModel.swift
//  MediaViewer
//
//  Created by Steffen Büschking on 08.02.24.
//

import Foundation

class EarthModel: ObservableObject, Identifiable {
    @Published var header: String = ""
    @Published var content: String = ""
    @Published var isOpened: Bool = false
}
