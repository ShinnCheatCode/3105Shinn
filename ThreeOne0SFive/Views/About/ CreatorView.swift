// Màn hình nhà sáng tạo, có nút copy số tài khoản donate
// và nút mở trực tiếp app Telegram qua scheme tg://.
import SwiftUI
import UIKit

struct CreatorView: View {
    // Số tài khoản donate hiển thị và copy.
    @State private var copied: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    creatorHeader
                    creatorInfo
                    creatorLinks
                    creatorDonate
                }
                .padding(16)
            }
            .background(Color(red: 0.05, green: 0.07, blue: 0.15).ignoresSafeArea())
            .navigationTitle("Nhà sáng tạo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Tiêu đề màn hình.
    private var creatorHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .font(.system(size: 40))
                .foregroundStyle(.purple)
            Text("Nhà sáng tạo ứng dụng").font(.largeTitle.bold())
            Text("Shinn Cheat v2.0").font(.headline).foregroundStyle(.secondary)
        }
    }

    // Thông tin tác giả và app gốc.
    private var creatorInfo: some View {
        VStack(alignment: .leading, spacing: 10) {
            creatorRow(icon: "hammer.fill", title: "Build & make", value: "NgVuMinhHieuu")
            creatorRow(icon: "shippingbox", title: "App gốc", value: "3105 YangJiiii")
        }
    }

    // Liên hệ Telegram, mở trực tiếp app Telegram.
    private var creatorLinks: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Liên hệ").font(.headline)

            telegramRow(icon: "paperplane.fill",
                        title: "Telegram Admin",
                        value: "@ShinnThieuu",
                        tgURL: "tg://resolve?domain=ShinnThieuu",
                        webURL: "https://t.me/ShinnThieuu")

            telegramRow(icon: "square.and.arrow.up",
                        title: "Group Share",
                        value: "t.me/ShinnCheatShare",
                        tgURL: "tg://resolve?domain=ShinnCheatShare",
                        webURL: "https://t.me/ShinnCheatShare")

            telegramRow(icon: "bubble.left.and.bubble.right.fill",
                        title: "Group Chat",
                        value: "t.me/ShinnCheatChat",
                        tgURL: "tg://resolve?domain=ShinnCheatChat",
                        webURL: "https://t.me/ShinnCheatChat")
        }
    }

    // Thông tin donate, bấm để copy.
    private var creatorDonate: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Donate").font(.headline)

            Button {
                // Sao chép số tài khoản MB Bank vào clipboard.
                UIPasteboard.general.string = "104877777"
                copied = true
                // Tắt nhãn sau 2 giây.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    copied = false
                }
            } label: {
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: "banknote.fill")
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.purple)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("MB Bank").font(.caption).foregroundStyle(.secondary)
                        Text("104877777").font(.body)
                    }
                    Spacer()
                    Image(systemName: copied ? "checkmark" : "doc.on.doc")
                        .foregroundStyle(copied ? .green : .secondary)
                }
            }
            .buttonStyle(.plain)

            if copied {
                Text("Đã sao chép số tài khoản")
                    .font(.caption)
                    .foregroundStyle(.green)
            }
        }
    }

    // Dòng thông tin dạng icon - tiêu đề - giá trị.
    private func creatorRow(icon: String, title: String, value: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .frame(width: 24, height: 24)
                .foregroundStyle(.purple)
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.caption).foregroundStyle(.secondary)
                Text(value).font(.body)
            }
        }
    }

    // Dòng liên kết Telegram, ưu tiên mở app Telegram.
    private func telegramRow(icon: String,
                             title: String,
                             value: String,
                             tgURL: String,
                             webURL: String) -> some View {
        Button {
            // Thử mở app Telegram bằng scheme tg://.
            if let tg = URL(string: tgURL), UIApplication.shared.canOpenURL(tg) {
                UIApplication.shared.open(tg)
            } else if let web = URL(string: webURL) {
                // Fallback mở bằng trình duyệt.
                UIApplication.shared.open(web)
            }
        } label: {
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: icon)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.purple)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title).font(.caption).foregroundStyle(.secondary)
                    Text(value).font(.body).foregroundStyle(.blue)
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundStyle(.secondary)
            }
        }
        .buttonStyle(.plain)
    }
}