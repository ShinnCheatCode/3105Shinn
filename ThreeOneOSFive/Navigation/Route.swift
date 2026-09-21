// Định nghĩa route cho NavigationStack.
import Foundation

enum Route: Hashable {
    case packageDetail(id: String)
    case sourceDetail(id: String)
    case fileDetail(path: String)
    case settingsAdvanced
}