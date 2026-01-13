//
//  NodeRowView.swift
//  chellenge
//
//  Created by Luis Bezerra on 11/01/26.
//

import SwiftUI

struct NodeRowView: View {
    let node: LightningNodeResponse

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            headerView
            publicKeyView
            statsView
            footerView
        }
        .padding(16)
        .background(AppColors.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - NodeRowView Builders
extension NodeRowView {
    @ViewBuilder
    private var headerView: some View {
        HStack {
            Text(node.alias.isEmpty ? ViewStrings.NodeRow.anonymous : node.alias)
                .font(.headline)
                .foregroundColor(AppColors.primaryText)
            Spacer()
            channelBadge
        }
    }

    @ViewBuilder
    private var channelBadge: some View {
        Text(ViewStrings.NodeRow.channelCount(node.channels))
            .font(.caption.bold())
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(AppColors.statusBackground)
            .foregroundColor(AppColors.accent)
            .clipShape(Capsule())
    }

    @ViewBuilder
    private var publicKeyView: some View {
        Text(node.publicKey)
            .font(.system(size: 10, design: .monospaced))
            .foregroundColor(AppColors.secondaryText)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(Color.black.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }

    @ViewBuilder
    private var statsView: some View {
        HStack(alignment: .top, spacing: 20) {
            HStack(spacing: 4) {
                AppImages.bitcoin
                    .padding(.top, 2)
                Text(node.btcCapacity)
            }
            .font(.subheadline.bold())
            .foregroundColor(AppColors.btcOrange)

            Spacer()

            HStack(alignment: .top, spacing: 4) {
                Text(node.locationString)
                    .multilineTextAlignment(.trailing)
                    .fixedSize(horizontal: false, vertical: true)
                AppImages.locationPin
                    .padding(.top, 2)
            }
            .font(.caption)
            .foregroundColor(AppColors.secondaryText)
        }
    }

    @ViewBuilder
    private var footerView: some View {
        HStack {
            timestampColumn(title: ViewStrings.NodeRow.firstSeen, value: node.formattedFirstSeen, alignment: .leading)
            Spacer()
            timestampColumn(title: ViewStrings.NodeRow.updatedAt, value: node.formattedUpdatedAt, alignment: .trailing)
        }
        .padding(.top, 4)
        .foregroundColor(AppColors.secondaryText)
    }

    @ViewBuilder
    private func timestampColumn(title: String, value: String, alignment: HorizontalAlignment) -> some View {
        VStack(alignment: alignment, spacing: 2) {
            Text(title).font(.system(size: 8, weight: .bold))
            Text(value).font(.system(size: 10))
        }
    }
}
