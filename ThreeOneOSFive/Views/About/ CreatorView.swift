// Màn hình nhà sáng tạo ứng dụng Shinn Cheat v2.0.
// Trình bày thông tin tác giả, app gốc, liên hệ, donate.
import SwiftUI

struct CreatorView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 1. Tiêu đề.
                    creatorHeader

                    // 2. Thông tin tác giả và app gốc.
                    creatorInfo

                    // 3. Liên hệ Telegram và nhóm.
                    creatorLinks

                    // 4. Thông tin donate.
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
            creatorRow(icon: "hammer.fill",   title: "Build & make", value: "NgVuMinhHieuu")
            creatorRow(icon: "shippingbox",   title: "App gốc",       value: "3105 YangJiiii")
        }
    }

    // Liên hệ Telegram và nhóm.
    private var creatorLinks: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Liên hệ").font(.headline)

            creatorLink(icon: "paperplane.fill",
                        title: "Telegram Admin",
                        value: "@ShinnThieuu",
                        url: "https://t.me/ShinnThieuu")

            creatorLink(icon: "square.and.arrow.up",
                        title: "Group Share",
                        value: "t.me/ShinnCheatShare",
                        url: "https://t.me/ShinnCheatShare")

            creatorLink(icon: "bubble.left.and.bubble.right.fill",
                        title: "Group Chat",
                        value: "t.me/ShinnCheatChat",
                        url: "https://t.me/ShinnCheatChat")
        }
    }

    // Thông tin donate.
    private var creatorDonate: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Donate").font(.headline)
            creatorRow(icon: "banknote.fill",
                       title: "MB Bank",
                       value: "104877777")
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

    // Dòng liên kết có thể bấm mở URL.
    private func creatorLink(icon: String, title: String, value: String, url: String) -> some View {
        Link(destination: URL(string: url)!) {
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
    }
}