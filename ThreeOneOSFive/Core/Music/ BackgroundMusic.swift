// Trình phát nhạc nền tự động khi mở app.
// Dùng AVPlayer phát luồng âm thanh từ URL.
import Foundation
import AVFoundation

final class BackgroundMusic {
    static let shared = BackgroundMusic()

    // Trình phát nhạc.
    private var player: AVPlayer?
    // Cấu hình phiên âm thanh.
    private let session = AVAudioSession.sharedInstance()

    // Bật nhạc nền khi mở app.
    func start() {
        configureSession()
        guard let url = musicURL() else { return }
        player = AVPlayer(url: url)
        // Phát lặp vô hạn.
        player?.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(loop),
            name: .AVPlayerItemDidPlayToEndTime,
            object: player?.currentItem
        )
        player?.play()
    }

    // Dừng nhạc nền.
    func stop() {
        player?.pause()
        player = nil
    }

    // Cấu hình phiên âm thanh cho chế độ phát nền.
    private func configureSession() {
        try? session.setCategory(.playback, mode: .default, options: [.mixWithOthers])
        try? session.setActive(true)
    }

    // Lặp lại khi hết bài.
    @objc private func loop() {
        player?.seek(to: .zero)
        player?.play()
    }

    // URL file nhạc trong bundle.
    private func musicURL() -> URL? {
        // Đặt file nhạc vào Resources với tên background_music.mp3.
        return Bundle.main.url(forResource: "background_music", withExtension: "mp3")
    }
}