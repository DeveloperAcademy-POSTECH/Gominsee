import SwiftUI

extension Color {
    static let primaryColor = Color(hex: "#DC8D6C")
    static let mainGreen = Color(hex: "#788C62")
    static let subLightGreen = Color(hex: "#97A884")
    static let subIvory = Color(hex: "#E6E7D5")
    static let backgroundColor = Color(hex: "#EEEEEE")
    static let answerColor = Color.black.opacity(0.2)
    static let mainBlack = Color(hex: "1B1C1E")

    init(hex: String) {
        let scanner = Scanner(string: hex)
        let _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
