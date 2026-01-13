//
//  ContentView.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NodeViewModel()

    var body: some View {
        NavigationView {
            Group {
                switch viewModel.state {
                case .idle, .loading:
                    LoadingView(message: ViewStrings.Main.loadingMessage)

                case .loaded(let nodes):
                    List(nodes) { node in
                        NodeRowView(node: node)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.fetchNodes()
                    }

                case .empty:
                    EmptyStateView()

                case .error(let message):
                    ErrorStateView(message: message) {
                        Task { await viewModel.fetchNodes() }
                    }
                }
            }
            .navigationTitle(ViewStrings.Main.title)
            .background(AppColors.background)
        }
    }
}

#Preview {
    ContentView()
}
