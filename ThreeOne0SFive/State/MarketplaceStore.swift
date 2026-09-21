// Tải repo.json từ URL, giải mã gói, lọc theo app cho phép.
import Foundation

final class MarketplaceStore: ObservableObject {
    @Published var packages: [Package] = []
    @Published var isLoading: Bool = false
    @Published var error: String?

    // Tải một repo từ URL và gộp gói vào danh sách.
    func load(repo url: String) {
        guard let u = URL(string: url) else { return }
        isLoading = true
        error = nil

        URLSession.shared.dataTask(with: u) { data, _, err in
            defer { DispatchQueue.main.async { self.isLoading = false } }
            if let err {
                DispatchQueue.main.async { self.error = err.localizedDescription }
                return
            }
            guard let data else { return }

            do {
                // Schema repo ShinnCheatShare.
                struct Repo: Decodable {
                    let identifier: String
                    let name: String
                    let packages: [Package]
                }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let repo = try decoder.decode(Repo.self, from: data)

                DispatchQueue.main.async {
                    // Gộp gói mới, tránh trùng identifier.
                    let existing = Set(self.packages.map { $0.identifier })
                    let merged = repo.packages.filter { !existing.contains($0.identifier) }
                    self.packages.append(contentsOf: merged)
                }
            } catch {
                DispatchQueue.main.async { self.error = error.localizedDescription }
            }
        }.resume()
    }

    // Trả về gói theo phân đoạn Home.
    func packages(for segment: HomeSegment) -> [Package] {
        switch segment {
        case .forYou:   return packages.filter { $0.featured }
        case .new:      return packages.sorted { $0.publishedAt > $1.publishedAt }
        case .sources:  return packages
        }
    }

    // Lọc theo category, dùng cho màn hình Tag.
    func packages(category: String) -> [Package] {
        return packages.filter { $0.category == category }
    }

    // Danh sách category duy nhất.
    var categories: [String] {
        Array(Set(packages.map { $0.category })).sorted()
    }

    // Đếm số gói theo category.
    func count(category: String) -> Int {
        return packages.filter { $0.category == category }.count
    }
}