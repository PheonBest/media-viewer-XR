import Foundation
import UIKit

struct StrapiImage: Codable & IdentifiableObject {
    struct Format: Codable {
        let ext: String
        let url: String
        let hash: String
        let mime: String
        let name: String
        let path: String?
        let size: Double
        let width: Int
        let height: Int
        let isUrlSigned: Bool
    }

    struct Formats: Codable {
        let large: Format?
        let small: Format?
        let medium: Format?
        let thumbnail: Format?
    }

    var id: Int? = -1
    let name: String
    let alternativeText: String?
    let caption: String?
    let width: Int
    let height: Int
    let formats: Formats
    let hash: String
    let ext: String
    let mime: String
    let size: Double
    let url: String
    let previewUrl: String?
    let provider: String
    let providerMetadata: String?
    let createdAt: String
    let updatedAt: String
    let isUrlSigned: Bool

    func getUrlStr(preferred: String = "quality") -> String? {
        if preferred == "quality" {
            if let largeFormat = formats.large {
                return largeFormat.url
            } else if let mediumFormat = formats.medium {
                return mediumFormat.url
            } else if let smallFormat = formats.small {
                return smallFormat.url
            } else if let thumbnailFormat = formats.thumbnail {
                return thumbnailFormat.url
            }
        }
        if let thumbnailFormat = formats.thumbnail {
            return thumbnailFormat.url
        } else if let smallFormat = formats.small {
            return smallFormat.url
        } else if let mediumFormat = formats.medium {
            return mediumFormat.url
        } else if let largeFormat = formats.large {
            return largeFormat.url
        }
        return nil
    }

    func getImage(preferred: String = "quality") -> UIImage {
        do {
            if let urlStr = getUrlStr(preferred: preferred), let url = URL(string: urlStr) {
                let data = try Data(contentsOf: url)
                return UIImage(data: data) ?? UIImage(named: "404.png")!
            }
        } catch {
            print("Error loading image data: \(error)")
        }

        return UIImage(named: "404.png")!
    }
}
