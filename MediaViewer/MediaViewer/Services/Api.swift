import Foundation

enum Api {
    static func get<T: Decodable>(_ urlString: String, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: convertToURL(urlString), method: "GET", as: type)
    }

    static func get<T: Decodable>(_ url: URL, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: url, method: "GET", as: type)
    }

    static func post<T: Decodable>(_ urlString: String, body: Data, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: convertToURL(urlString), method: "POST", body: body, as: type)
    }

    static func post<T: Decodable>(_ url: URL, body: Data, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: url, method: "POST", body: body, as: type)
    }

    static func put<T: Decodable>(_ urlString: String, body: Data, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: convertToURL(urlString), method: "PUT", body: body, as: type)
    }

    static func put<T: Decodable>(_ url: URL, body: Data, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: url, method: "PUT", body: body, as: type)
    }

    static func delete<T: Decodable>(_ urlString: String, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: convertToURL(urlString), method: "DELETE", as: type)
    }

    static func delete<T: Decodable>(_ url: URL, as type: T.Type = T.self) async throws -> T? {
        return try await request(url: url, method: "DELETE", as: type)
    }

    static func request<T: Decodable>(url: URL, method: String, body: Data? = nil, as type: T.Type = T.self) async throws -> T? {
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let body = body {
            request.httpBody = body
        }
        if method != "GET" {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.addValue("Bearer \(Config.strapiToken)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200 ..< 300).contains(httpResponse.statusCode) else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            let bodyString = String(data: request.httpBody ?? Data(), encoding: .utf8)
            let errorMessage = "Error: \(method) \(url): Invalid HTTP response (\(statusCode)) : body : \(String(describing: bodyString))"
            throw MyError.basic(errorMessage)
        }

        if T.self != Void.self {
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedResponse = try decoder.decode(T.self, from: data)
                return decodedResponse
            } catch {
                let bodyString = String(data: request.httpBody ?? Data(), encoding: .utf8)
                throw MyError.basic("Error: \(method) \(url): \(error) : body : \(String(describing: bodyString))")
            }
        } else {
            return nil
        }
    }

    private static func convertToURL(_ urlString: String) throws -> URL {
        guard let url = URL(string: "\(Config.baseURL)\(urlString)") else {
            throw MyError.basic("Invalid URL: \(urlString)")
        }
        return url
    }
}
