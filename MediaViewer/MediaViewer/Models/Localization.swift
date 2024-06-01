import Foundation

struct Localization: Codable & IdentifiableObject {
    var id: Int? = -1
    let locale: String
}
