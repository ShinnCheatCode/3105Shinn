// Màn hình gốc của module ShimCheat trong 3105.
import SwiftUI

struct ShimCheatRootView: View {
    @EnvironmentObject var shimState: ShimCheatState
    @State private var route: ShimCheatRoute = .home

    var body: some View {
        NavigationStack {
            Group {
                switch route {
                case .home:      ShimCheatHomeView()
                case .games:     ShimCheatGamesView()
                case .tools:     ShimCheatToolsView()
                case .settings:  ShimCheatSettingsView()
                }
            }
            .navigationTitle(route.title)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu {
                        Button("Trang chủ") { route = .home }
                        Button("Trò chơi")  { route = .games }
                        Button("Công cụ")   { route = .tools }
                        Button("Cài đặt")   { route = .settings }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
        }
    }
}

enum ShimCheatRoute: Hashable {
    case home, games, tools, settings

    var title: String {
        switch self {
        case .home:     return "ShimCheat"
        case .games:    return "Trò chơi"
        case .tools:    return "Công cụ"
        case .settings: return "Cài đặt"
        }
    }
}