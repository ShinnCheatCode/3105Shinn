// Trạng thái marketplace: gói theo phân đoạn.
import Foundation

final class MarketplaceStore: ObservableObject {
    @Published var packages: [Package] = []

    func packages(for segment: HomeSegment) -> [Package] {
        switch segment {
        case .forYou: return packages
        case .new: return packages.sorted { $0.dateAdded > $1.dateAdded }
        case .sources: return packages
        }
    }
}