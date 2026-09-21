// Quản lý repository: thêm, xóa, làm mới nguồn.
import SwiftUI

struct SourcesView: View {
    @EnvironmentObject var appState: AppState
    @State private var newSourceURL: String = ""

    var body: some View {
        NavigationStack {
            List {
                Section("Đã thêm") {
                    ForEach(appState.sources.items) { source in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(source.name).font(.headline)
                            Text(source.url).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                    .onDelete { indexSet in
                        appState.sources.remove(at: indexSet)
                    }
                }

                Section("Thêm nguồn") {
                    TextField("https://...", text: $newSourceURL)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.URL)
                    Button("Thêm") {
                        appState.sources.add(url: newSourceURL)
                        newSourceURL = ""
                    }
                }
            }
            .navigationTitle("Sources")
            .toolbar {
                Button {
                    appState.sources.refreshAll()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
}