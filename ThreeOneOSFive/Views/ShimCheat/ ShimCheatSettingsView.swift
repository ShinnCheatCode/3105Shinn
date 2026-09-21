// Cài đặt riêng của ShimCheat trong 3105.
import SwiftUI

struct ShimCheatSettingsView: View {
    @EnvironmentObject var shimState: ShimCheatState

    var body: some View {
        Form {
            Section("Hiển thị") {
                Toggle("Hiện icon trên Home", isOn: $shimState.showIcon)
                Toggle("Ghi log hoạt động", isOn: $shimState.logEnabled)
            }

            Section("Bảo mật") {
                SecureField("Mật khẩu patch", text: $shimState.patchPassword)
            }

            Section("Khôi phục") {
                Button("Gỡ mọi thay đổi", role: .destructive) {
                    shimState.clearAll()
                }
            }
        }
    }
}