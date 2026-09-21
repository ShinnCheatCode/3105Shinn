// Trạng thái thư viện đã cài.
import Foundation

final class InstalledStore: ObservableObject {
    @Published var items: [InstalledItem] = []

    func remove(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
}