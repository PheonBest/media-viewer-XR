import AVKit
import SwiftUI

struct VideoTemplateView: View {
    var videoSource: String
    var fileExtension: String?

    init(videoSource: String, fileExtension: String? = nil) {
        self.videoSource = videoSource
        self.fileExtension = fileExtension
    }

    var body: some View {
        GeometryReader { _ in
            if let videoFilePath = getVideoFilePath() {
                AnyView(EnhancedVideoPlayer([videoFilePath], endAction: .none))
            } else {
                AnyView(EmptyView())
            }
        }
    }

    private func getVideoFilePath() -> URL? {
        if videoSource.hasPrefix("http") {
            return URL(string: videoSource.replacingOccurrences(of: "http://", with: "https://", range: videoSource.range(of: "http://")))
        } else {
            return Bundle.main.url(forResource: videoSource, withExtension: fileExtension)
        }
    }
}

#Preview {
    VideoTemplateView(videoSource: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4")
}