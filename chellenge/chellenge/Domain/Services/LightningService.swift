//
//  LightningService.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

final class LightningService {
    private let client: HTTPClient

    init(client: HTTPClient = HTTPClient()) {
        self.client = client
    }

    func fetchTopNodes() async throws -> [LightningNodeResponse] {
        try await client.sendRequest(endpoint: LightningAPIEndpoint.getRankings)
    }
}
