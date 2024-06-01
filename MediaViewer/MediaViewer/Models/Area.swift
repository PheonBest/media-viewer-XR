import Foundation

enum Area : String, Identifiable, CaseIterable, Equatable
{
    // app areas we will use for navigation purposes
    case viewer, mediaPicker
    var id: Self { self }
    var name: String { rawValue.capitalized }
    
    var title: String {
        switch self {
            case .viewer:
                "Viewer"
            case .mediaPicker:
                "MediaPicker"
        }
    }
}
