import Foundation

public enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist not found")
        }
        return dict
    }()

    static let baseURL: URL = {
        guard let baseURL = Config.infoDictionary[Keys.baseURL.rawValue] as? String else {
            fatalError("Base URL not set in plist")
        }
        guard let url = URL(string: baseURL) else {
            fatalError("Base URL is invalid")
        }
        return url
    }()

    static let strapiToken: String = {
        guard let strapiToken = Config.infoDictionary[Keys.strapiToken.rawValue] as? String else {
            fatalError("Strapi token not set in plist")
        }
        return strapiToken
    }()

    static let strapiUserId: Int = {
        guard let strapiUserIdString = Config.infoDictionary[Keys.strapiUserId.rawValue] as? String,
              let strapiUserId = Int(strapiUserIdString)
        else {
            fatalError("Strapi user id not set or not convertible to Int in plist")
        }
        return strapiUserId
    }()

    private enum Keys: String {
        case baseURL = "BASE_URL"
        case strapiToken = "STRAPI_TOKEN"
        case strapiUserId = "STRAPI_USER_ID"
    }
}
