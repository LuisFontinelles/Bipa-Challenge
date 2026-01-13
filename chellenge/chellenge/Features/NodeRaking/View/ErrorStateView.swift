//
//  ErrorStateView.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import SwiftUI

struct ErrorStateView: View {
    let message: String
    let retryAction: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            AppImages.errorWifi
                .font(.system(size: 50))
                .foregroundColor(.red)

            VStack(spacing: 8) {
                Text(ViewStrings.Error.title)
                    .font(.headline)
                    .foregroundColor(AppColors.primaryText)
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(AppColors.secondaryText)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)

            Button(action: retryAction) {
                Label(ViewStrings.Global.retry, systemImage: AppImages.refreshIconName)
                    .fontWeight(.semibold)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
