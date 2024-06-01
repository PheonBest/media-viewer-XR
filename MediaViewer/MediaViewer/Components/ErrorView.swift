import SwiftUI

struct Errorview: View {
    let error: Error

    var body: some View {
        Text("Errorview: \(error.localizedDescription)")
    }

    init(_ error: Error) {
        self.error = error
    }
}
