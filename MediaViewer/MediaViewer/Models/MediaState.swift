import Foundation

class MediaState: ObservableObject, Identifiable, Hashable {
    static func == (lhs: MediaState, rhs: MediaState) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    @Published var media: [Medium] = []
    @Published var selectedPageIndex: Int = 0
    @Published var selectedMedium: Medium? = nil
    @Published var searchText: String = ""
    @Published var locale: String = "en"
    @Published var tags: [Medium.Tag] = []
    @Published var readFilter: String = "All"
    @Published var archivedFilter: String = "Not Archived"
    @Published var modelUrl: URL?
    @Published var modelName: String?
    @Published var modelType: String = "URL"

    init() {
        Task(priority: .medium) {
            do {
                try media = await MediumService.fetchMedia(searchText: searchText, tags: tags, readFilter: readFilter, archivedFilter: archivedFilter, locale: locale)
                if !media.isEmpty, let mediumId = media[0].id {
                    try selectedMedium = await MediumService.fetchMedium(id: mediumId)
                }
                print("Media loaded successfully.")
            } catch let error as MyError {
                print(error.toString())
            }
        }
    }
}
