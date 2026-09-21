// Cầu nối lấy dữ liệu container để hiển thị trong Files.
import Foundation

final class ContainerManagerBridge {
    func listAppContainers() -> [ContainerEntry] { return [] }
    func listAppGroups() -> [ContainerEntry] { return [] }
}

struct ContainerEntry: Identifiable {
    let id: String
    let name: String
    let path: String
}