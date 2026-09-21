// Màn hình chi tiết repo: header, danh sách tag, số gói.
import SwiftUI

struct RepoDetailView: View {
    let source: Source
    @EnvironmentObject var appState: AppState

    var body: some View {
        List {
            Section {
                HStack(spacing: 12) {
                    Image(systemName: "shippingbox.fill")
                        .frame(width: 56, height: 56)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(source.name).font(.headline)
                        Text("Nguồn Repository").font(.caption).foregroundStyle(.secondary)
                        Text("\(appState.marketplace.packages.count) gói")
                            .font(.caption2).foregroundStyle(.tertiary)
                    }
                }
            }

            Section("Tag") {
                NavigationLink {
                    PackageListView(title: "Tất cả gói",
                                    packages: appState.marketplace.packages)
                } label: {
                    TagRow(title: "Tất cả gói",
                           count: appState.marketplace.packages.count)
                }

                ForEach(appState.marketplace.categories, id: \.self) { cat in
                    NavigationLink {
                        PackageListView(title: cat,
                                        packages: appState.marketplace.packages(category: cat))
                    } label: {
                        TagRow(title: cat,
                               count: appState.marketplace.count(category: cat))
                    }
                }
            }
        }
        .navigationTitle(source.name)
        .onAppear {
            // Tải repo khi mở màn hình.
            appState.marketplace.load(repo: source.url)
        }
    }
}

// Dòng tag với số gói.
struct TagRow: View {
    let title: String
    let count: Int

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "shippingbox")
                .frame(width: 32, height: 32)
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.body)
                Text("\(count) gói").font(.caption).foregroundStyle(.secondary)
            }
        }
    }
}