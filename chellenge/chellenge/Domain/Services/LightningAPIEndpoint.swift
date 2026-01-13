//
//  LightningAPIEndpoint.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

enum LightningAPIEndpoint: Endpoint {
    case getRankings

    var baseURL: String { APIConstants.baseURL }

    var path: String {
        switch self {
        case .getRankings: return APIConstants.Paths.connectivityRankings
        }
    }

    var method: HTTPMethod { .get }
}
