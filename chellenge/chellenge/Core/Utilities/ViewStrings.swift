//
//  ViewStrings.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

struct ViewStrings {
    struct Global {
        static let unknown = "Unknown"
        static let retry = "Try Again"
    }

    struct Main {
        static let title = "Top Lightning"
        static let loadingMessage = "Fetching most connected nodes..."
    }

    struct NodeRow {
        static let anonymous = "Anonymous Node"
        static func channelCount(_ count: Int) -> String { "\(count) channels" }
        static let capacityLabel = "BTC CAPACITY"
        static let firstSeen = "FIRST SEEN"
        static let updatedAt = "UPDATED AT"
    }

    struct Error {
        static let title = "Oops! Something went wrong"
        static let noNodes = "No nodes found"
    }
}
