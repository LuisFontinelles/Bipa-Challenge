//
//  EmptyStateView.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            AppImages.emptyTray
                .font(.system(size: 50))
                .foregroundColor(AppColors.secondaryText)
            Text(ViewStrings.Error.noNodes)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
