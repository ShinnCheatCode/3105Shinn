// Trạng thái trung tâm của 3105, bao gồm ShimCheatState.
import SwiftUI

final class AppState: ObservableObject {
    @Published var marketplace = MarketplaceStore()
    @Published var installed = InstalledStore()
    @Published var sources = SourcesStore()
    @Published var files = FilesStore()
    @Published var shimCheat = ShimCheatState()
    @Published var language: String = "vi"

    func setLanguage(_ code: String) { language = code }
    func backup() { /* triển khai sao lưu */ }
    func restore() { /* triển khai phục hồi */ }
    func reset() { /* triển khai đặt lại */ }
    func removeActivePatches() { /* triển khai gỡ patch */ }
}