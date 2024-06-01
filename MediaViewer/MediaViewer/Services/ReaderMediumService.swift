import Foundation
struct ReaderMediumService {
    @available(*, unavailable) private init() {}

    static func getReaderMedium(readerId: Int, mediumId: Int) async throws -> ReaderMedium? {
        // Get ReaderMedium
        let response = try await Api.get("/api/reader-mediums?filters[reader][id]=\(readerId)&filters[medium][id]=\(mediumId)&populate=*", as: ApiResponseArray<ReaderMedium>.self)
        if let response = response {
            let readerMedia = response.getData()
            if readerMedia.count > 0 {
                return readerMedia[0]
            }
            // Create ReaderMedium
            let data = [
                "data": [
                    "readTime": 0,
                    "read": false,
                    "archived": false,
                    "lastOpenedAt": nil,
                    "rating": nil,
                    "reader": [
                        "id": readerId
                    ],
                    "medium": [
                        "id": mediumId
                    ]
                ]
            ]
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [.fragmentsAllowed])

            let createResponse = try await Api.post("/api/reader-mediums", body: jsonData, as: ApiResponse<ReaderMedium>.self)
            if let createResponse = createResponse {
                return createResponse.getData()
            }
        }
        throw MyError.basic("Error while fetching ReaderMedium")
    }
}
