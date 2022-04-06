//
//  MainView.swift
//  mentortee
//
//  Created by Mingwan Choi on 2022/04/06.
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
    
    static let gradientBrownStart = Color(hex: "#C5AC9A")
    static let gradientBrownEnd = Color(hex: "e2d7cd")
    
}

struct MainView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "YY년 M월 d일 (eeee)"
        return formatter
    }()
    
    var dailyQuestion = "OOO님이 생각하는 이상적인 삶은 어떤 모습인가요?"
    var categoryList = ["가치관"]
    
    struct PlainGroupBoxStyle: GroupBoxStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                configuration.label
                configuration.content
            }
            .padding(.bottom, 150)
            .padding(.top, 30)
            .padding(.horizontal, 20)
            .background(LinearGradient(gradient: Gradient(colors:[Color.gradientBrownStart, Color.gradientBrownEnd]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    var today = Date()
    var body: some View {
        VStack {
            GroupBox(content: {
                Text("\(today, formatter: MainView.dateformat)")
                    .bold()
                Spacer()
                Text(dailyQuestion)
                    .bold()
                    .font(.system(size: 35))
                    .minimumScaleFactor(0.5)
                    .frame(width: screenWidth * 0.7, height: screenHeight * 0.2)
                HStack {
                    ForEach(categoryList, id: \.self){ value in
                        Text(value).padding(.vertical, 3)
                            .padding(.horizontal, 10)
                            .foregroundColor(Color.gradientBrownStart)
                            .background(RoundedRectangle(cornerRadius: 10))
                            .font(.system(size: 14))
                    }
                }
            })
            .foregroundColor(.white)
            .groupBoxStyle(PlainGroupBoxStyle())
            .frame(width: screenWidth * 0.8, height: screenHeight * 0.45)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
