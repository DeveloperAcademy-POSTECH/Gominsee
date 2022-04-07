//
//  MainView.swift
//  mentortee
//
//  Created by Mingwan Choi on 2022/04/06.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
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
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 150, trailing: 20))
            .background(LinearGradient(gradient: Gradient(colors:[Color.primaryColor, Color.subIvory]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
    
    var today = Date()
    @State private var cardHeight = UIScreen.main.bounds.height * 0.45
    @State private var cardTextHeight = UIScreen.main.bounds.height * 0.2
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            GroupBox(content: {
                Text("\(today, formatter: MainView.dateformat)")
                    .bold()
                Spacer()
                Text(dailyQuestion)
                    .bold()
                    .font(.system(size: 35))
                    .minimumScaleFactor(0.5)
                    .frame(width: screenWidth * 0.7, height: cardTextHeight)
                HStack {
                    ForEach(categoryList, id: \.self){ value in
                        Text(value).padding(.vertical, 3)
                            .padding(.horizontal, 10)
                            .foregroundColor(Color.primaryColor)
                            .background(RoundedRectangle(cornerRadius: 10))
                            .font(.system(size: 14))
                    }
                }
            })
            .frame(width: screenWidth * 0.8, height: cardHeight)
            .foregroundColor(.white)
            .groupBoxStyle(PlainGroupBoxStyle())
            
            TextField("질문에 대한 나의 생각을 적어보세요.", text: .constant(""))
                .padding(.init(top: 16, leading: 16, bottom: 0, trailing: 16))
                .onTapGesture {
                    cardHeight = screenHeight * 0.1
                    cardTextHeight = screenHeight * 0.1
                }
                .frame(width: screenWidth * 0.8, height: screenHeight * 0.225, alignment: .top)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                
        }.onTapGesture {
            hideKeyboard()
            cardHeight = UIScreen.main.bounds.height * 0.45
            cardTextHeight = screenHeight * 0.2
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
