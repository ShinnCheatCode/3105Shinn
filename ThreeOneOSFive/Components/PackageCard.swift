// Thẻ hiển thị một gói trong marketplace.
import SwiftUI

struct PackageCard: View {
    let package: Package

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: package.iconName)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 4) {
                Text(package.name).font(.headline)
                Text(package.summary).font(.caption).foregroundStyle(.secondary)
                Text(package.type.label).font(.caption2).foregroundStyle(.tertiary)
            }
            Spacer()
            if !package.isCompatible {
                StatusBadge(text: "N/A", color: .red)
            }
        }
        .padding(.vertical, 4)
    }
}