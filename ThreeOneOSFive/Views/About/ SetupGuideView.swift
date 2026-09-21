// Màn hình cài đặt và hướng dẫn sử dụng Shinn Cheat v2.0 - bản gộp một file.
// Gồm tiêu đề, mô tả, chức năng chính, cách sử dụng, lưu ý.
import SwiftUI

struct SetupGuideView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 1. Tiêu đề màn hình.
                    guideHeader

                    // 2. Mô tả ngắn về ứng dụng.
                    guideSummary

                    // 3. Danh sách chức năng chính.
                    guideFeatures

                    // 4. Các bước sử dụng.
                    guideSteps

                    // 5. Lưu ý sau khi sử dụng.
                    guideNotice
                }
                .padding(16)
            }
            .background(Color(red: 0.05, green: 0.07, blue: 0.15).ignoresSafeArea())
            .navigationTitle("Cài đặt & Sử dụng")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Tiêu đề màn hình.
    private var guideHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "book.fill")
                .font(.system(size: 40))
                .foregroundStyle(.purple)
            Text("Cài đặt & Sử dụng").font(.largeTitle.bold())
            Text("Shinn Cheat v2.0").font(.headline).foregroundStyle(.secondary)
        }
    }

    // Đoạn mô tả ngắn.
    private var guideSummary: some View {
        Text("Shinn Cheat v2.0 là ứng dụng tiện ích với giao diện đơn giản, hiện đại và dễ sử dụng.")
            .font(.body)
    }

    // Danh sách chức năng chính.
    private var guideFeatures: some View {
        let features: [(String, String)] = [
            ("iphone",                          "Hiển thị thông tin thiết bị"),
            ("number",                          "Kiểm tra dung lượng và SHA-256 của file"),
            ("wrench.and.screwdriver.fill",     "Quản lý các patch và công cụ được tích hợp"),
            ("icloud.and.arrow.down",           "Hỗ trợ cập nhật phiên bản"),
            ("person.3.fill",                   "Phân quyền Owner, Admin, Support và Member")
        ]

        return VStack(alignment: .leading, spacing: 10) {
            Text("Chức năng chính").font(.headline)
            ForEach(features, id: \.1) { item in
                HStack(alignment: .top, spacing: 12) {
                    Image(systemName: item.0)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.purple)
                    Text(item.1).font(.body)
                }
            }
        }
    }

    // Các bước sử dụng.
    private var guideSteps: some View {
        let steps: [String] = [
            "Tải patch cần sử dụng.",
            "Chọn Áp dụng Patch.",
            "Sau khi áp dụng, tiến hành sử dụng.",
            "Sử dụng xong, chọn Khôi phục Patch để đưa file về trạng thái ban đầu.",
            "Nên khôi phục sau khi sử dụng để hạn chế lỗi không mong muốn."
        ]

        return VStack(alignment: .leading, spacing: 10) {
            Text("Cách sử dụng").font(.headline)
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1).")
                        .font(.body.bold())
                        .foregroundStyle(.purple)
                        .frame(width: 24, alignment: .leading)
                    Text(step).font(.body)
                }
            }
        }
    }

    // Lưu ý sau khi sử dụng.
    private var guideNotice: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.yellow)
            Text("Khôi phục patch sau khi sử dụng để tránh lỗi không mong muốn cho app mục tiêu.")
                .font(.callout)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}