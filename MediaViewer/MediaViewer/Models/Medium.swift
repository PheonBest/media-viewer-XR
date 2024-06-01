import Foundation
import SwiftUI
import UIKit

class Page: IdentifiableObject, Identifiable, Hashable, Codable {
    var id: Int? = -1
    var title: String
    var backgroundImage: ApiResponse<StrapiImage>?
    var backgroundColor: CodableColor?
    var content: [RichTextNode]?
    var createdAt: StrapiDate?
    var updatedAt: StrapiDate?
    var backgroundImageCredit: String?

    func hash(into hasher: inout Hasher) {
        hasher.combine("\(id!)\(title)")
    }

    static func == (lhs: Page, rhs: Page) -> Bool {
        lhs.title == rhs.title && lhs.id == rhs.id
    }

    enum CodingKeys: String, CodingKey {
        case title
        case backgroundImage
        case backgroundColor
        case content
        case createdAt
        case updatedAt
        case backgroundImageCredit
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        backgroundImage = try container.decodeIfPresentAndNotNull(ApiResponse<StrapiImage>.self, forKey: .backgroundImage)
        backgroundColor = try container.decodeIfPresentAndNotNull(CodableColor.self, forKey: .backgroundColor)
        content = try container.decodeIfPresentAndNotNull([RichTextNode].self, forKey: .content)
        createdAt = try container.decodeIfPresentAndNotNull(StrapiDate.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresentAndNotNull(StrapiDate.self, forKey: .updatedAt)
        backgroundImageCredit = try container.decodeIfPresentAndNotNull(String.self, forKey: .backgroundImageCredit)
    }
}

class Medium: IdentifiableObject, Equatable, Codable {
    var id: Int? = -1
    let title: String
    let description: [RichTextNode]?
    let cover: ApiResponse<StrapiImage>?
    let info: ApiResponse<Info>?
    let tags: ApiResponseArray<Tag>?
    let pages: ApiResponseArray<Page>?
    let coverCredit: String?
    let authors: ApiResponseArray<Author>?
    var createdAt: StrapiDate?
    var updatedAt: StrapiDate?
    let locale: String
    let localizations: ApiResponseArray<Localization>?

    init(id: Int? = -1, title: String, description: [RichTextNode]? = nil, cover: ApiResponse<StrapiImage>? = nil, info: ApiResponse<Info>? = nil, tags: ApiResponseArray<Tag>? = nil, pages: ApiResponseArray<Page>? = nil, coverCredit: String? = nil, authors: ApiResponseArray<Author>? = nil, createdAt: StrapiDate? = nil, updatedAt: StrapiDate? = nil, locale: String, localizations: ApiResponseArray<Localization>? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.cover = cover
        self.info = info
        self.tags = tags
        self.pages = pages
        self.coverCredit = coverCredit
        self.authors = authors
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.locale = locale
        self.localizations = localizations
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decodeIfPresent([RichTextNode].self, forKey: .description)
        cover = try container.decodeIfPresent(ApiResponse<StrapiImage>.self, forKey: .cover)
        info = try container.decodeIfPresentAndNotNull(ApiResponse<Info>.self, forKey: .info)
        tags = try container.decodeIfPresent(ApiResponseArray<Tag>.self, forKey: .tags)
        pages = try container.decodeIfPresent(ApiResponseArray<Page>.self, forKey: .pages)
        coverCredit = try container.decodeIfPresent(String.self, forKey: .coverCredit)
        authors = try container.decodeIfPresent(ApiResponseArray<Author>.self, forKey: .authors)
        createdAt = try container.decodeIfPresent(StrapiDate.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(StrapiDate.self, forKey: .updatedAt)
        locale = try container.decode(String.self, forKey: .locale)
        localizations = try container.decodeIfPresent(ApiResponseArray<Localization>.self, forKey: .localizations)
    }

    enum CodingKeys: String, CodingKey {
        case title
        case description
        case cover
        case info
        case tags
        case pages
        case coverCredit
        case authors
        case createdAt
        case updatedAt
        case locale
        case localizations
    }

    static func == (lhs: Medium, rhs: Medium) -> Bool {
        return
            lhs.id == rhs.id ||
            lhs.title == rhs.title
    }

    struct Author: IdentifiableObject, Identifiable, Hashable, Codable {
        var id: Int? = -1
        var name: String

        enum CodingKeys: String, CodingKey {
            case name
        }
    }

    struct Info: IdentifiableObject, Identifiable, Hashable, Codable {
        var id: Int? = -1
        var releaseDate: StrapiDate
        var rating: Double
        var nbVoters: Int

        static func == (lhs: Info, rhs: Info) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }

    struct Tag: IdentifiableObject, Identifiable, Hashable, Codable {
        var id: Int? = -1
        let name: String

        static func == (lhs: Tag, rhs: Tag) -> Bool {
            lhs.id == rhs.id || lhs.name == rhs.name
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }

        enum CodingKeys: String, CodingKey {
            case name
        }
    }

    struct Language: IdentifiableObject, Identifiable, Hashable, Codable {
        var id: Int? = -1
        let name: String
        let value: String
        let color: String?

        enum CodingKeys: String, CodingKey {
            case name
            case value
            case color
        }

        static func == (lhs: Language, rhs: Language) -> Bool {
            lhs.id == rhs.id || lhs.name == rhs.name
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
    }
}

extension UIColor {
    var suColor: Color { Color(self) }
    var hexString: String {
        let components = cgColor.components!
        let r = components[0]
        let g = components[1]
        let b = components[2]
        if components.count > 3 {
            let a = components[3]
            return String(format: "#%02lX%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)), lroundf(Float(a * 255)))
        }
        return String(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
    }

    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat

        if hexString.hasPrefix("#") {
            let startIndex = hexString.index(after: hexString.startIndex)
            let hexColor = String(hexString[startIndex...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            } else if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: 1)
                    return
                }
            }
        }

        return nil
    }
}

@propertyWrapper
struct CodableColor {
    var wrappedValue: UIColor?
}

extension CodableColor: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let hexString = try? container.decode(String.self) {
            if let color = UIColor(hexString: hexString) {
                wrappedValue = color
                return
            }
        }
        wrappedValue = nil
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue?.hexString.trimmingCharacters(in: .whitespacesAndNewlines))
    }
}
