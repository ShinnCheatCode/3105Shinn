// Màn hình giới thiệu Shinn Cheat v2.0 - bản gộp toàn bộ thành phần.
// Trình bày mô tả, chức năng chính, thông tin phiên bản, chân trang.
import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 1. Header: logo, tên, phiên bản.
                    aboutHeader

                    // 2. Mô tả ngắn về ứng dụng.
                    aboutSummary

                    // 3. Danh sách chức năng chính.
                    aboutFeatures

                    // 4. Thông tin phiên bản.
                    aboutVersion

                    // 5. Chân trang.
                    aboutFooter
                }
                .padding(16)
            }
            .background(Color(red: 0.05, green: 0.07, blue: 0.15).ignoresSafeArea())
            .navigationTitle("Giới thiệu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Phần đầu màn hình giới thiệu.
    private var aboutHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "crown.fill")
                .font(.system(size: 44))
                .foregroundStyle(.purple)

            Text("Shinn Cheat").font(.largeTitle.bold())
            Text("v2.0").font(.headline).foregroundStyle(.secondary)
        }
    }

    // Đoạn mô tả ngắn.
    private var aboutSummary: some View {
        Text("Shinn Cheat v2.0 là ứng dụng tiện ích được thiết kế với giao diện đơn giản, hiện đại và dễ sử dụng.")
            .font(.body)
    }

    // Danh sách chức năng chính.
    private var aboutFeatures: some View {
        // Mỗi phần tử gồm icon, tiêu đề, mô tả phụ.
        let features: [(String, String, String)] = [
            ("folder.fill",
             "Quản lý và kiểm tra file",
             "Duyệt, xem, kiểm tra tệp trong container."),
            ("iphone",
             "Hiển thị thông tin thiết bị",
             "Tên máy, phiên bản iOS, build, dung lượng."),
            ("number",
             "Kiểm tra dung lượng và mã SHA-256 của file",
             "Xác thực toàn vẹn tệp trước khi dùng."),
            ("wrench.and.screwdriver.fill",
             "Quản lý các công cụ được tích hợp",
             "Bật tắt, sắp xếp công cụ trong app."),
            ("icloud.and.arrow.down",
             "Hỗ trợ cập nhật phiên bản",
             "Kiểm tra và tải bản mới từ repo."),
            ("person.3.fill",
             "Hệ thống phân quyền",
             "Owner, Admin, Support và Member."),
            ("antenna.radiowaves.left.and.right",
             "Hiển thị trạng thái thiết bị",
             "Kết nối, phiên bản ứng dụng, tình trạng chung.")
        ]

        return VStack(alignment: .leading, spacing: 12) {
            Text("Chức năng chính").font(.headline)

            ForEach(features, id: \.1) { item in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: item.0)
                        .frame(width: 28, height: 28)
                        .foregroundStyle(.purple)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(item.1).font(.body)
                        Text(item.2).font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
        }
    }

    // Thông tin phiên bản ứng dụng.
    private var aboutVersion: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Phiên bản").font(.headline)
            Text("Shinn Cheat v2.0")
            Text("Bundle ID: com.apple.mobile.MobileHouseArrest")
                .font(.caption).foregroundStyle(.secondary)
            Text("Kênh phân phối: 3105Shinn")
                .font(.caption).foregroundStyle(.secondary)
        }
    }

    // Chân trang màn hình giới thiệu.
    private var aboutFooter: some View {
        VStack(spacing: 4) {
            HStack(spacing: 6) {
                Image(systemName: "heart.fill").foregroundStyle(.pink)
                Text("Free · Community Edition").font(.caption)
            }
            Text("3105Shinn").font(.caption2).foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 12)
    }
}