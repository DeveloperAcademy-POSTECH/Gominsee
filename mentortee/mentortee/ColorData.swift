//
//  ColorData.swift
//  mentortee
//
//  Created by Mingwan Choi on 2022/04/07.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

extension Color {
    static let primaryColor = Color(hex: "#DC8D6C")
    static let subColor = Color(hex: "#E7C794")
    static let mainGreen = Color(hex: "#788C62")
    static let subDeepGreen = Color(hex: "#53584C")
    static let subLightGreen = Color(hex: "#97A884")
    static let subIvory = Color(hex: "#E6E7D5")
    static let backgroundColor = Color(hex: "#F5F5F5")
    static let inactiveColor = Color(hex: "#999999")
}
