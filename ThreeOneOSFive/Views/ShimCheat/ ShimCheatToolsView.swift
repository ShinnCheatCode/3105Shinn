// Công cụ phụ trợ: chỉnh sửa plist, sao lưu, khôi phục.
import SwiftUI

struct ShimCheatToolsView: View {
    @EnvironmentObject var shimState: ShimCheatState

    var body: some View {
        List {
            Section("Dữ liệu") {
                Button("Sao lưu")   { shimState.backup() }
                Button("Khôi phục") { shimState.restore() }
            }

            Section("Tệp cấu hình") {
                ForEach(shimState.configFiles) { file in
                    HStack {
                        Image(systemName: "doc.text")
                        Text(file.name)
                        Spacer()
                        if file.modified {
                            StatusBadge(text: "Đã sửa", color: .orange)
                        }
                    }
                }
            }
        }
    }
}