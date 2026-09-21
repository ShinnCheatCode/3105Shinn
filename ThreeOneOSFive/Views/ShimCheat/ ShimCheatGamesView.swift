// Danh sách game được hỗ trợ chỉnh sửa trong 3105.
import SwiftUI

struct ShimCheatGamesView: View {
    @EnvironmentObject var shimState: ShimCheatState

    var body: some View {
        List {
            ForEach($shimState.games) { $game in
                HStack {
                    Image(systemName: "gamecontroller")
                    VStack(alignment: .leading, spacing: 2) {
                        Text(game.name)
                        Text(game.bundleID)
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Toggle("", isOn: $game.enabled)
                        .labelsHidden()
                }
            }
        }
    }
}