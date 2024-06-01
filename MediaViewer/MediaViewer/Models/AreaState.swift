import Foundation

enum AREAS: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    case MEDIA_PICKER = "Media Picker"
    case CONTENT_VIEW = "Content View"
    
    var iconName: String {
        switch self {
        case .MEDIA_PICKER:
            return "menucard"
        case .CONTENT_VIEW:
            return "book"
        }
    }
}

class AreaState: ObservableObject {
    @Published var area: AREAS? = .MEDIA_PICKER

    func switchArea(_ newArea: AREAS) {
        area = newArea
    }
}
