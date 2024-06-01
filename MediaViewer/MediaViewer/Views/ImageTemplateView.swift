import SwiftUI

struct ImageTemplateView: View {
    @State var imageSource: String
    @State var aspectRatio: CGFloat? = nil
    @State var contentMode: ContentMode = .fill

    var body: some View {
        GeometryReader { _ in
            if imageSource.contains("http:") || imageSource.contains("https:") {
                AsyncImage(url: URL(string: imageSource), transaction: .init(animation: .spring())) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: contentMode)
                            .transition(.opacity.combined(with: .scale))
                    case .empty:
                        Text("Image loading...")
                    case .failure(let error):
                        Errorview(error)
                    @unknown default:
                        Text("Image loading...")
                    }
                }
            } else {
                Image(imageSource)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
            }
        }
    }
}

#Preview {
    ImageTemplateView(imageSource: "https://hdqwalls.com/download/big-sun-sunset-water-body-4k-sm-2560x1440.jpg")
}
