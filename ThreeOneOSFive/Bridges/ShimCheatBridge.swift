// Cầu nối native cho ShimCheat, dùng cơ chế container của 3105.
import Foundation

final class ShimCheatBridge {
    static let shared = ShimCheatBridge()

    func apply(bundleID: String, configPath: String) -> Bool {
        // Chèn logic gốc của AppShimnCheat tại đây.
        return false
    }

    func restore(bundleID: String) -> Bool {
        // Chèn logic gốc của AppShimnCheat tại đây.
        return false
    }

    func listTargets() -> [String] {
        return []
    }
}