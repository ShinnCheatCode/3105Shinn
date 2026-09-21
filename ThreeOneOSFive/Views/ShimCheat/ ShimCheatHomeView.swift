// Trang chủ ShimCheat: trạng thái, công tắc tổng, thông tin phiên bản.
import SwiftUI

struct ShimCheatHomeView: View {
    @EnvironmentObject var shimState: ShimCheatState

    var body: some View {
        List {
            Section("Trạng thái") {
                HStack {
                    Text("Đã kích hoạt")
                    Spacer()
                    StatusBadge(
                        text: shimState.isActive ? "BẬT" : "TẮT",
                        color: shimState.isActive ? .green : .gray
                    )
                }
                Text("Phiên bản: \(shimState.version)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Section("Công tắc tổng") {
                Toggle("Kích hoạt ShimCheat", isOn: $shimState.isActive)
            }

            Section("Tích hợp 3105") {
                HStack {
                    Text("ContainerManager")
                    Spacer()
                    StatusBadge(text: "Sẵn sàng", color: .green)
                }
                HStack {
                    Text("Patch Engine")
                    Spacer()
                    StatusBadge(text: "Sẵn sàng", color: .green)
                }
            }
        }
    }
}