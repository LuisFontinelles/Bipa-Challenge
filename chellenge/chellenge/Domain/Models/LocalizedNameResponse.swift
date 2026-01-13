//
//  LocalizedNameResponse.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import Foundation

struct LocalizedNameResponse: Codable {
    let portuguese: String?
    let english: String?

    enum CodingKeys: String, CodingKey {
        case portuguese = "pt-BR"
        case english = "en"
    }

    var displayName: String {
        english ?? portuguese ?? ViewStrings.Global.unknown
    }
}
