import Foundation

class ReaderMedium: Codable & IdentifiableObject {
    var id: Int? = -1
    let readTime: Int?
    let read: Bool?
    let archived: Bool?
    let lastOpenedAt: StrapiDate?
    let createdAt: StrapiDate?
    let updatedAt: StrapiDate?
    let rating: Int?
    let reader: ApiResponse<Reader>?
    let medium: ApiResponse<Medium>?

    enum CodingKeys: String, CodingKey {
        case readTime, read, archived, lastOpenedAt, createdAt, updatedAt, rating, reader, medium
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        readTime = try container.decodeIfPresentAndNotNull(Int.self, forKey: .readTime)
        read = try container.decodeIfPresentAndNotNull(Bool.self, forKey: .read)
        archived = try container.decodeIfPresentAndNotNull(Bool.self, forKey: .archived)
        lastOpenedAt = try container.decodeIfPresentAndNotNull(StrapiDate.self, forKey: .lastOpenedAt)
        createdAt = try container.decodeIfPresentAndNotNull(StrapiDate.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresentAndNotNull(StrapiDate.self, forKey: .updatedAt)
        rating = try container.decodeIfPresentAndNotNull(Int.self, forKey: .rating)
        reader = try container.decodeIfPresentAndNotNull(ApiResponse<Reader>.self, forKey: .reader)
        medium = try container.decodeIfPresentAndNotNull(ApiResponse<Medium>.self, forKey: .medium)
    }
}
