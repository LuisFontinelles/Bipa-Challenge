//
//  AppColors.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import SwiftUI

struct AppColors {
    static let primaryText = Color.primary
    static let background = Color(.systemGroupedBackground)
    static let cardBackground = Color(.secondarySystemGroupedBackground)
    static let adaptiveContrast = Color(UIColor { traitCollection in
        return traitCollection.userInterfaceStyle == .dark ? .white : .black
    })
    static let accent = Color.blue
    static let secondaryText = Color.secondary
    static let btcOrange = Color.orange
    static let statusBackground = Color.blue.opacity(0.1)
}
