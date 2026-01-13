//
//  NodeViewModel.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import SwiftUI
import Combine

@MainActor
class NodeViewModel: ObservableObject {
    @Published private(set) var state: ViewState = .idle
    private let service = LightningService()

    init() {
        Task { await fetchNodes() }
    }

    func fetchNodes() async {
        if case .loaded = state { } else {
            state = .loading
        }

        do {
            let nodes = try await service.fetchTopNodes()
            state = nodes.isEmpty ? .empty : .loaded(nodes)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
