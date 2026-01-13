//
//  NetworkError.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case serverError(statusCode: Int)
    case encodingFailed
    case unknown(Error?)

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "The provided URL is invalid."
        case .invalidResponse: return "The server returned an invalid response."
        case .decodingError(let error): return "Failed to decode the response: \(error.localizedDescription)"
        case .serverError(let statusCode): return "Server error with status code: \(statusCode)."
        case .encodingFailed: return "Failed to encode the request body."
        case .unknown(let error): return "Unknown error: \(error?.localizedDescription ?? "N/A")"
        }
    }
}
