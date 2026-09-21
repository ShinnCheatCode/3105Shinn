// Mô hình gói theo schema repo ShinnCheatShare.
// Ánh xạ đúng trường identifier, download, sha256, supportedOS.
import Foundation

struct Package: Identifiable, Codable {
    let identifier: String
    let name: String
    let author: String
    let version: String
    let summary: String
    let description: String
    let category: String
    let tags: [String]
    let publishedAt: Date
    let download: String
    let sha256: String
    let size: Int64
    let supportedOS: [SupportedOS]
    let featured: Bool
    let isPrivate: Bool
    let icon: String

    // Dùng identifier làm khóa định danh.
    var id: String { identifier }
}

// Dải hệ điều hành được hỗ trợ theo gói.
struct SupportedOS: Codable {
    let minimum: String
    let maximum: String
    let builds: [String]?
}