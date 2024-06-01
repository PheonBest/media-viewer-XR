import Foundation

enum RichTextType: String, Codable {
    case text
    case url
    case paragraph
    case heading
    case list
    case quote
    case code
    case image
    case link
    case listItem

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)

        // Handle the case where the raw value is "list-item"
        if rawValue == "list-item" {
            self = .listItem
        } else {
            // Use the raw value directly for other cases
            if let enumValue = RichTextType(rawValue: rawValue) {
                self = enumValue
            } else {
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Invalid raw value: \(rawValue)"
                )
            }
        }
    }
}
