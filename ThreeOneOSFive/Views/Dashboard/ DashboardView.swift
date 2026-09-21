// Thêm liên kết tới AboutView trong Dashboard.
import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    DashboardHeader()
                    WelcomeBanner(userName: "Shinn", status: .connected)

                    // Nút mở màn hình giới thiệu.
                    NavigationLink {
                        AboutView()
                    } label: {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("Giới thiệu")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.horizontal, 16)
            }
            .background(Color(red: 0.05, green: 0.07, blue: 0.15).ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}