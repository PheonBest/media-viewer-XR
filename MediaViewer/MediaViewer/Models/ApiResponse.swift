import Foundation

struct ApiResponse<T: Codable & IdentifiableObject>: Codable {
    struct Data<U: Codable>: Codable {
        let id: Int
        let attributes: U

        private enum CodingKeys: String, CodingKey {
            case id, attributes
        }
    }

    let data: Data<T>

    func getData() -> T {
        var object = data.attributes
        object.id = data.id
        return object
    }

    private enum CodingKeys: String, CodingKey {
        case data
    }
}

struct ApiResponseArray<T: Codable & IdentifiableObject>: Codable {
    struct Data<U: Codable>: Codable {
        let id: Int
        let attributes: U

        private enum CodingKeys: String, CodingKey {
            case id, attributes
        }
    }

    let data: [Data<T>]

    init() {
        data = []
    }

    func getData() -> [T] {
        data.compactMap { (data) -> T? in
            var object = data.attributes
            object.id = data.id
            return object
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case data
    }
}
