// Cầu nối áp dụng patch và trả kết quả cho UI.
import Foundation

final class PatchEngineBridge {
    func apply(patchID: String) -> PatchResult {
        return PatchResult(success: false, message: "")
    }

    func remove(patchID: String) -> PatchResult {
        return PatchResult(success: false, message: "")
    }
}

struct PatchResult {
    let success: Bool
    let message: String
}