// Gọi BackgroundMusic.start khi app khởi động.
import SwiftUI

@main
struct ThreeOneOSFiveApp: App {
    @StateObject private var appState = AppState()
    @AppStorage("hasAcceptedTerms") private var hasAcceptedTerms: Bool = false
    // Bật tắt nhạc nền qua cài đặt.
    @AppStorage("musicEnabled") private var musicEnabled: Bool = true

    var body: some Scene {
        WindowGroup {
            Group {
                if hasAcceptedTerms {
                    RootView()
                        .environmentObject(appState)
                        .environmentObject(appState.shimCheat)
                } else {
                    TermsView()
                }
            }
            .onAppear {
                // Chỉ phát nhạc khi người dùng đã bật.
                if musicEnabled {
                    BackgroundMusic.shared.start()
                }
            }
        }
    }
}