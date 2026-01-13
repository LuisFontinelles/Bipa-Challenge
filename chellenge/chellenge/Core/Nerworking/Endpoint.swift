//
//  Endpoint.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var body: Encodable? { get }
    var queryParameters: [String: Any]? { get }
    var headers: [String: String] { get }
}

extension Endpoint {
    var headers: [String: String] { [:] }
    var body: Encodable? { nil }
    var queryParameters: [String: Any]? { nil }

    var url: URL? {
        guard let base = URL(string: baseURL) else { return nil }
        let fullURL = base.appendingPathComponent(path)
        guard var components = URLComponents(url: fullURL, resolvingAgainstBaseURL: false) else { return nil }

        if let queryParams = queryParameters, !queryParams.isEmpty {
            components.queryItems = queryParams.map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
        }
        return components.url
    }
}
