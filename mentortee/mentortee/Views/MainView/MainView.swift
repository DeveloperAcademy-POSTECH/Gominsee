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
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 100, trailing: 20))
                .frame(width: UIScreen.main.bounds.width - 50, height: nil)
                .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.primaryColor, Color.subIvory]),
                    startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

    var today = Date()
    @State private var cardHeight = UIScreen.main.bounds.height * 0.45
    @State private var cardTextHeight = UIScreen.main.bounds.height * 0.2
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                HStack {

                    Text("고민씨")
                        .padding(.all, 16)
                        .font(.system(size: 22)
                            .weight(.bold))
                        .foregroundColor(.primaryColor)
                    Spacer()
                    NavigationLink(destination: TopBar())
                    {
                        Image(systemName: "square.and.pencil")
                            .padding(.all, 16)
                            .font(.system(size: 26))
                            .foregroundColor(.mainGreen)
                    }
                }
                    .padding(.all, 16)
                GroupBox(content: {
                    Text("\(today, formatter: MainView.dateformat)")
                        .bold()
                    Text(dailyQuestion)
                        .bold()
                        .font(.system(size: 35))
                        .minimumScaleFactor(0.5)
                        .frame(width: nil, height: cardTextHeight)
                    HStack {
                        ForEach(categoryList, id: \.self) { value in
                            Text(value).padding(.vertical, 3)
                                .padding(.horizontal, 10)
                                .foregroundColor(Color.primaryColor)
                                .background(RoundedRectangle(cornerRadius: 10))
                                .font(.system(size: 14))
                        }
                    }
                })
                    .foregroundColor(.white)
                    .groupBoxStyle(PlainGroupBoxStyle())

                TextField("질문에 대한 나의 생각을 적어보세요.", text: .constant(""))
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: screenHeight * 0.15, trailing: 16))
                    .background(
                    RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
                    .frame(width: UIScreen.main.bounds.width - 50, height: nil)
                    .onTapGesture {
                    cardHeight = screenHeight * 0.1
                    cardTextHeight = screenHeight * 0.1
                }
            }

                .onTapGesture {
                hideKeyboard()
                cardHeight = UIScreen.main.bounds.height * 0.45
                cardTextHeight = screenHeight * 0.2
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TestView: View {
    var body: some View {
        Text("TestView")
    }
}
