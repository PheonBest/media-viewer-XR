import Foundation

extension KeyedDecodingContainer {
    func decodeIfPresentAndNotNull<T>(_ type: T.Type, forKey key: K) throws -> T? where T: Decodable {
        if let value = try? decode(T.self, forKey: key) {
            return value
        } else {
            // If the value is null or the decoding fails, return nil
            return nil
        }
    }
}
