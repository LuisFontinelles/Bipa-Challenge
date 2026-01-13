//
//  LoadingView.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import SwiftUI

struct LoadingView: View {
    let message: String

    var body: some View {
        VStack(spacing: 12) {
            ProgressView()
                .scaleEffect(1.5)
            Text(message)
                .font(.subheadline)
                .foregroundColor(AppColors.secondaryText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
