//
//  LocationDialogView.swift
//  MediaViewer
//
//  Created by Steffen Büschking on 07.02.24.
//

import SwiftUI

struct LocationDialogView: View {
    @EnvironmentObject var earthModel: EarthModel
    var body: some View {
        if earthModel.isOpened {
            VStack(alignment: .center) {
                Text(earthModel.header)
                    .font(.largeTitle)
                    .bold()
                    .padding(20)
                Text(earthModel.content)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 40)
            }
            .frame(maxWidth: 400)
            .glassBackgroundEffect()
        } else {
            EmptyView()
        }
        
    }
}

#Preview {
    LocationDialogView()
}
