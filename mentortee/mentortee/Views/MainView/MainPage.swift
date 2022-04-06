//
//  MainPage.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/05.
//

import SwiftUI

struct MainPage: View {
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "YY년 M월 d일 (eeee)"
        return formatter
    }()
    
    var today = Date()
    
    var body: some View {
        VStack {
            Text("\(today, formatter: MainPage.dateformat)")
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(
                    cornerRadius: 20))
        }
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
