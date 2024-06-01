import Foundation

struct MediumService {
    @available(*, unavailable) private init() {}
    
    static func fetchMedia(
        searchText: String? = nil,
        tags: [Medium.Tag]? = nil,
        readFilter: String? = nil,
        archivedFilter: String? = nil,
        locale: String? = nil
    ) async throws -> [Medium] {
        var urlComponents = URLComponents(string: "\(Config.baseURL)/api/media")!
        
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "sort", value: "updatedAt:desc"))
        if let searchText = searchText, !searchText.isEmpty {
            queryItems.append(URLQueryItem(name: "filters[title][$contains]", value: searchText))
            queryItems.append(URLQueryItem(name: "filters[description][$contains]", value: searchText))
        }
        if let tags = tags, !tags.isEmpty {
            for tag in tags {
                queryItems.append(URLQueryItem(name: "filters[tags][id]", value: String(tag.id!)))
            }
        }
        if let readFilter = readFilter, !readFilter.isEmpty, readFilter != "All" {
            queryItems.append(URLQueryItem(name: "filters[reader_media][reader]", value: String(Config.strapiUserId)))
            queryItems.append(URLQueryItem(name: "filters[reader_media][read]", value: readFilter == "Read" ? "true" : "false"))
        }
        if let archivedFilter = archivedFilter, !archivedFilter.isEmpty, archivedFilter != "Not Archived" {
            queryItems.append(URLQueryItem(name: "filters[reader_media][reader]", value: String(Config.strapiUserId)))
            queryItems.append(URLQueryItem(name: "filters[reader_media][archived]", value: archivedFilter == "Archived" ? "true" : "false"))
        }
        queryItems.append(URLQueryItem(name: "populate", value: "cover,pages,pages.backgroundImage,authors,tags,info,localizations"))
        if let locale = locale, !locale.isEmpty, locale != "All" {
            queryItems.append(URLQueryItem(name: "locale", value: locale))
        }
        
        urlComponents.queryItems = queryItems
        
        print(urlComponents)
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        let response = try await Api.get(url, as: ApiResponseArray<Medium>.self)
        if let response = response {
            return response.getData()
        }
        return []
    }
    
    static func fetchMedium(id: Int) async throws -> Medium {
        var urlComponents = URLComponents(string: "\(Config.baseURL)/api/media/\(id)")!
        
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "populate", value: "cover,pages,pages.backgroundImage,authors"))
        
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        let response = try await Api.get(url, as: ApiResponse<Medium>.self)
        if let response = response {
            return response.getData()
        }
        throw MyError.basic("Error fetching medium")
    }
}
