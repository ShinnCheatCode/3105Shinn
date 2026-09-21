// Chi tiết gói, nút cài đặt, tải file .3105 từ repo.
import SwiftUI

struct PackageDetailView: View {
    let package: Package
    @State private var progress: Double = 0
    @State private var installing: Bool = false

    var body: some View {
        List {
            Section {
                HStack(spacing: 12) {
                    AsyncImage(url: URL(string: package.icon)) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Image(systemName: "shippingbox")
                    }
                    .frame(width: 64, height: 64)
                    .clipShape(RoundedRectangle(cornerRadius: 12))

                    VStack(alignment: .leading, spacing: 4) {
                        Text(package.name).font(.headline)
                        Text(package.author).font(.caption).foregroundStyle(.secondary)
                        Text("Phiên bản \(package.version)")
                            .font(.caption2).foregroundStyle(.tertiary)
                    }
                }
            }

            Section("Mô tả") {
                Text(package.description)
            }

            Section("Thông tin") {
                Text("Tag: \(package.tags.joined(separator: ", "))")
                Text("Kích thước: \(package.size) bytes")
            }

            Section {
                if installing {
                    // Thanh tiến trình khi đang cài.
                    ProgressView(value: progress)
                } else {
                    Button("Cài đặt") {
                        install()
                    }
                }
            }
        }
        .navigationTitle(package.name)
    }

    // Tải và cài gói .3105 từ repo.
    private func install() {
        installing = true
        // Bước 1: tải file theo package.download.
        // Bước 2: xác thực sha256 so với package.sha256.
        // Bước 3: gọi PatchManager.apply với Patch tương ứng.
        // Bước 4: cập nhật tiến trình và kết thúc.
    }
}