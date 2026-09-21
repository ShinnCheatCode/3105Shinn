// Thêm liên kết tới CreatorView trong AboutView.
import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    aboutHeader
                    aboutSummary
                    aboutFeatures
                    aboutVersion
                    aboutFooter

                    NavigationLink {
                        SetupGuideView()
                    } label: {
                        HStack {
                            Image(systemName: "book")
                            Text("Cài đặt & Sử dụng")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    NavigationLink {
                        TermsView()
                    } label: {
                        HStack {
                            Image(systemName: "doc.text")
                            Text("Điều khoản sử dụng")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    NavigationLink {
                        CreatorView()
                    } label: {
                        HStack {
                            Image(systemName: "person.crop.circle")
                            Text("Nhà sáng tạo")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(16)
            }
            .background(Color(red: 0.05, green: 0.07, blue: 0.15).ignoresSafeArea())
            .navigationTitle("Giới thiệu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}