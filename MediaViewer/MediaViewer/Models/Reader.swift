import Foundation

struct Reader: Codable & IdentifiableObject {
    var id: Int? = -1
    let firstName: String
    let lastName: String
    let userName: String
    let email: String
    let createdAt: String
    let updatedAt: String
}
