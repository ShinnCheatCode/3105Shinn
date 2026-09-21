// Danh sách gói theo tag hoặc toàn bộ repo.
import SwiftUI

struct PackageListView: View {
    let title: String
    let packages: [Package]

    var body: some View {
        List(packages) { pkg in
            NavigationLink {
                PackageDetailView(package: pkg)
            } label: {
                HStack(spacing: 12) {
                    AsyncImage(url: URL(string: pkg.icon)) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Image(systemName: "shippingbox")
                    }
                    .frame(width: 44, height: 44)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    VStack(alignment: .leading, spacing: 2) {
                        Text(pkg.name).font(.body)
                        Text(pkg.summary).font(.caption).foregroundStyle(.secondary)
                        Text("\(pkg.author) · Phiên bản \(pkg.version)")
                            .font(.caption2).foregroundStyle(.tertiary)
                    }
                }
            }
        }
        .navigationTitle(title)
    }
}