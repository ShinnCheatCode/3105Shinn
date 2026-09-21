// Màn hình điều khoản sử dụng Shinn Cheat v2.0.
// Trình bày nội dung điều khoản, nút đồng ý và từ chối.
import SwiftUI

struct TermsView: View {
    // Trạng thái đã đồng ý điều khoản.
    @AppStorage("hasAcceptedTerms") private var hasAcceptedTerms: Bool = false
    // Điều khiển thoát màn hình khi từ chối.
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // 1. Tiêu đề.
                    termsHeader

                    // 2. Nội dung điều khoản.
                    termsContent

                    // 3. Nút hành động.
                    termsActions
                }
                .padding(16)
            }
            .background(Color(red: 0.05, green: 0.07, blue: 0.15).ignoresSafeArea())
            .navigationTitle("Điều khoản sử dụng")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Tiêu đề màn hình.
    private var termsHeader: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "doc.text.fill")
                .font(.system(size: 40))
                .foregroundStyle(.purple)
            Text("Điều khoản sử dụng").font(.largeTitle.bold())
            Text("Shinn Cheat v2.0").font(.headline).foregroundStyle(.secondary)
        }
    }

    // Nội dung điều khoản.
    private var termsContent: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Vui lòng sử dụng ứng dụng một cách thông minh và có trách nhiệm.")
                .font(.body)

            Text("Khi bạn cài đặt hoặc sử dụng patch, bạn được xem là đã đọc, hiểu và đồng ý với các điều khoản sử dụng, đồng thời tự chịu mọi rủi ro có thể phát sinh trong quá trình sử dụng.")
                .font(.body)

            Text("Nếu bạn không đồng ý với các điều khoản trên, vui lòng không sử dụng patch và xóa ứng dụng.")
                .font(.body)

            Text("Xin cảm ơn")
                .font(.body.italic())
                .foregroundStyle(.secondary)
        }
    }

    // Nút hành động.
    private var termsActions: some View {
        VStack(spacing: 12) {
            Button {
                // Ghi nhận đã đồng ý và đóng màn hình.
                hasAcceptedTerms = true
                dismiss()
            } label: {
                Text("Tôi đồng ý")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.purple)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Button {
                // Không đồng ý, chỉ đóng màn hình.
                dismiss()
            } label: {
                Text("Không đồng ý")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}