//
//  HTTPClient.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

final class HTTPClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func sendRequest<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let url = endpoint.url else { throw NetworkError.invalidURL }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        if let body = endpoint.body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            } catch {
                throw NetworkError.encodingFailed
            }
        }

        endpoint.headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        #if DEBUG
        logRequest(request: request, response: httpResponse, data: data)
        #endif

        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }

    private func logRequest(request: URLRequest, response: HTTPURLResponse, data: Data) {
        print("--- NETWORK LOG ---")
        print("[\(request.httpMethod ?? "N/A")] \(request.url?.absoluteString ?? "N/A")")
        print("RESPONSE [\(response.statusCode)]")
        print("--- END LOG ---")
    }
}
