// Trạng thái trung tâm cho module ShimCheat trong 3105.
import SwiftUI

final class ShimCheatState: ObservableObject {
    @Published var isActive: Bool = false
    @Published var showIcon: Bool = true
    @Published var logEnabled: Bool = false
    @Published var patchPassword: String = ""
    @Published var version: String = "1.0"
    @Published var games: [ShimGame] = []
    @Published var configFiles: [ShimConfigFile] = []

    func backup() { /* triển khai sao lưu */ }
    func restore() { /* triển khai phục hồi */ }
    func clearAll() { /* triển khai gỡ thay đổi */ }
}

struct ShimGame: Identifiable {
    let id = UUID()
    var name: String
    var bundleID: String
    var enabled: Bool
}

struct ShimConfigFile: Identifiable {
    let id = UUID()
    var name: String
    var modified: Bool
}