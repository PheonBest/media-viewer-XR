import SwiftUI

struct FetchButton: View {
    @Binding var isFetching: Bool
    var fetchAction: () async throws -> Void

    var body: some View {
        Button(action: {
            Task {
                do {
                    try await fetchAction()
                } catch {
                    // Handle errors if needed
                    print("Error fetching media: \(error)")
                }
            }
        }) {
            Image(systemName: "arrow.clockwise.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
        }
        .buttonBorderShape(.roundedRectangle)
        .buttonStyle(.bordered)
        .disabled(isFetching)
    }
}

struct FetchButton_Previews: PreviewProvider {
    static var previews: some View {
        FetchButton(isFetching: .constant(false)) {
            Task {
                do {
                    try await Task.sleep(nanoseconds: 1_000_000_000) // Simulating some async work
                } catch {}
            }
        }
        .padding()
    }
}
