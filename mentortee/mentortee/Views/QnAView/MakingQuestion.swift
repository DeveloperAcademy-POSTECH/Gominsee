//
//  MakingQuestion.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/07.
//

import SwiftUI

struct MakingQuestion: View {
    
    var body: some View {
        ZStack {
            QuestionMain()
        }
    }
}

struct MakingQuestion_Previews: PreviewProvider {
    static var previews: some View {
        MakingQuestion()
            
        }
    }



// Hex Color 추가 코드
extension Color {
 
//    static let peach = Color(hex: "#ff8882")
    static let Ivory = Color(hex: "E6E7D5")
    static let Text_sub2 = Color(hex: "807A7A")
    static let MainOrange = Color(hex: "DC8D6C")
    static let BackgroundGray = Color(hex: "D8D8D8")
            
            
}

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

//

// [ 추가 개발 요소]


// 1. 카테고리 누르면 색깔 바뀔 수 있게

// 2. 스위치 온/오프에 따라 각 페이지로 갈 수 있게

// 3. 상단바 어떻게 하지??

// 4. 간격 맞추는거 어떻게 하지?? 

