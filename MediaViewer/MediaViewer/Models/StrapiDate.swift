import Foundation

struct StrapiDate: Codable {
    var date: Date

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let dateString = try container.decode(String.self)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        date = formatter.date(from: dateString)!
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        try container.encode(formatter.string(from: date))
    }
}
