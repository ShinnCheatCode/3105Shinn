// Trình sửa plist đơn giản dạng key-value.
import SwiftUI

struct PlistEditorView: View {
    @Binding var entries: [PlistEntry]

    var body: some View {
        List {
            ForEach($entries) { $entry in
                HStack {
                    TextField("Key", text: $entry.key)
                    TextField("Value", text: $entry.value)
                }
            }
            .onDelete { indexSet in
                entries.remove(atOffsets: indexSet)
            }
        }
    }
}

struct PlistEntry: Identifiable {
    let id = UUID()
    var key: String
    var value: String
}