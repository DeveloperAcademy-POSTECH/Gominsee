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
    @ObservedObject var userSetting = UserSetting()
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)]) var UserInfo: FetchedResults<User>
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "YY년 M월 d일 (eeee)"
        return formatter
    }()

//    var dailyQuestion = "\(token)님이 생각하는 이상적인 삶은 어떤 모습인가요?"
    var categoryList = ["가치관"]

    struct PlainGroupBoxStyle: GroupBoxStyle {
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                configuration.label
                configuration.content
            }
                .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
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
    @State private var answerText = "질문에 대한 나의 생각을 적어보세요."
    @State private var answerColor = Color.black.opacity(0.2)
    @State private var tapTextEditor = false
    var body: some View {
            VStack(alignment: .center, spacing: 0) {
                GroupBox(content: {
                    Text("\(today, formatter: MainView.dateformat)")
                        .bold()
                    Text("\(self.userSetting.accessToken)님이 생각하는 이상적인 삶은 어떤 모습인가요?")
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
                    tapTextEditor ?
                    HStack {
                        Text("제출")
                            .foregroundColor(Color.mainGreen)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .background(
                                RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                print(answerText)
                            }
                    }
                    .padding(.top, 50)
                        .frame(width: screenWidth * 0.75, height: nil, alignment: .trailing)
                    : nil
                })
                    .foregroundColor(.white)
                    .groupBoxStyle(PlainGroupBoxStyle())

                TextEditor(text: $answerText)
                    .onTapGesture {
                    answerText = ""
                    answerColor = Color.black
                    cardHeight = screenHeight * 0.1
                    cardTextHeight = screenHeight * 0.1
                }
                    .foregroundColor(answerColor)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height * 0.2)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
                    .onChange(of: answerText) { value in
                        if answerText.count == 0 {
                            tapTextEditor = false
                        } else {
                            tapTextEditor = true
                        }
                }
            }
                .onTapGesture {
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
