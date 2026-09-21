// Cổng điều khoản trước khi vào RootView.
import SwiftUI

@main
struct ThreeOneOSFiveApp: App {
    @StateObject private var appState = AppState()
    // Trạng thái đã đồng ý điều khoản.
    @AppStorage("hasAcceptedTerms") private var hasAcceptedTerms: Bool = false

    var body: some Scene {
        WindowGroup {
            if hasAcceptedTerms {
                RootView()
                    .environmentObject(appState)
                    .environmentObject(appState.shimCheat)
            } else {
                TermsView()
            }
        }
    }
}