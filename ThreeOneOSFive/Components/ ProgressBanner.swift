// Banner hiển thị tiến trình tải hoặc cài đặt.
import SwiftUI

struct ProgressBanner: View {
    let title: String
    let progress: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.subheadline)
            ProgressView(value: progress)
        }
        .padding()
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}