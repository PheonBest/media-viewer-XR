// Full recipe at https://swiftuirecipes.com/blog/play-video-in-swiftui

import AVKit
import Foundation
import SwiftUI

struct EnhancedVideoPlayer<VideoOverlay: View>: View {
    @StateObject private var viewModel: ViewModel
    @ViewBuilder var videoOverlay: () -> VideoOverlay
    
    init(_ urls: [URL],
         endAction: EndAction = .none,
         @ViewBuilder videoOverlay: @escaping () -> VideoOverlay)
    {
        _viewModel = StateObject(wrappedValue: ViewModel(urls: urls, endAction: endAction))
        self.videoOverlay = videoOverlay
    }
    
    var body: some View {
        VideoPlayer(player: viewModel.player, videoOverlay: videoOverlay)
    }
    
    class ViewModel: ObservableObject {
        let player: AVQueuePlayer
        
        init(urls: [URL], endAction: EndAction) {
            let playerItems = urls.map { AVPlayerItem(url: $0) }
            player = AVQueuePlayer(items: playerItems)
            player.actionAtItemEnd = .none
            if endAction != .none {
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                                       object: nil,
                                                       queue: nil)
                { [self] notification in
                    let currentItem = notification.object as? AVPlayerItem
                    if endAction == .loop,
                       let currentItem = currentItem
                    {
                        player.seek(to: .zero)
                        player.advanceToNextItem()
                        player.insert(currentItem, after: nil)
                    } else if currentItem == playerItems.last,
                              case let .perform(action) = endAction
                    {
                        action()
                    }
                }
            }
        }
    }
    
    enum EndAction: Equatable {
        case none,
             loop,
             perform(() -> Void)
        
        static func == (lhs: EnhancedVideoPlayer<VideoOverlay>.EndAction,
                        rhs: EnhancedVideoPlayer<VideoOverlay>.EndAction) -> Bool
        {
            if case .none = lhs,
               case .none = rhs
            {
                return true
            }
            if case .loop = lhs,
               case .loop = rhs
            {
                return true
            }
            if case .perform = lhs,
               case .perform = rhs
            {
                return true
            }
            return false
        }
    }
}

extension EnhancedVideoPlayer where VideoOverlay == EmptyView {
    init(_ urls: [URL], endAction: EndAction) {
        self.init(urls, endAction: endAction) {
            EmptyView()
        }
    }
}
