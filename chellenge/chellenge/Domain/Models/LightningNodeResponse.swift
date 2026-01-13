//
//  LightningNodeResponse.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

struct LightningNodeResponse: Codable, Identifiable {
    let id = UUID()
    let publicKey: String
    let alias: String
    let channels: Int
    let capacity: Int64
    let firstSeen: TimeInterval
    let updatedAt: TimeInterval
    let city: LocalizedNameResponse?
    let country: LocalizedNameResponse?

    enum CodingKeys: String, CodingKey {
        case publicKey, alias, channels, capacity, firstSeen, updatedAt, city, country
    }

    var btcCapacity: String {
        let satoshisDecimal = Decimal(capacity)
        let btcDivider = Decimal(100_000_000)
        let btcValue = satoshisDecimal / btcDivider

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 8
        formatter.maximumFractionDigits = 8

        return (formatter.string(from: btcValue as NSDecimalNumber) ?? "0.00000000") + " BTC"
    }

    var formattedFirstSeen: String {
        Date(timeIntervalSince1970: firstSeen).formatted(date: .abbreviated, time: .shortened)
    }

    var formattedUpdatedAt: String {
        Date(timeIntervalSince1970: updatedAt).formatted(date: .abbreviated, time: .shortened)
    }

    var locationString: String {
        let baseLocation: String
        if let country = country {
            if let city = city {
                baseLocation = "\(city.displayName), \(country.displayName)"
            } else {
                baseLocation = country.displayName
            }
        } else {
            baseLocation = ViewStrings.Global.unknown
        }

        return baseLocation.replacingOccurrences(of: ", ", with: ",\n")
    }
}
