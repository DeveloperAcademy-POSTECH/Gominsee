import SwiftUI

struct MainView: View {
    var dailyQuestion = "Chemi님은 뭘 할 때 행복한가요 ?"
    var categoryList = ["가치관"]
    var today = Date()
    @State private var cardHeight = UIScreen.main.bounds.height * 0.45
    @State private var cardTextHeight = UIScreen.main.bounds.height * 0.2
    @State private var answerText = "질문에 대한 나의 생각을 적어보세요."
    @State private var answerColor = Color.black.opacity(0.2)
    @State private var tapTextEditor = false
    @State private var showAlert = false

    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "YY년 M월 d일 (eeee)"
        return formatter
    }()

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading) {
                    Text("\(today, formatter: MainView.dateformat)")
                        .bold()
                        .padding(.top, 20)
                    Text(dailyQuestion)
                        .dailyQuestion()
                        .frame(width: geometry.size.width * 0.8, height: cardTextHeight, alignment: .leading)

                    HStack {
                        ForEach(categoryList, id: \.self) { value in
                            Text(value)
                                .dailyCategoryStyle()
                        }
                    }

                    Button("제출하기", action: answerText.count == 0
                            || answerText == "질문에 대한 나의 생각을 적어보세요."
                            ? { }
                        : {
                            showAlert = true
                            answerText = "질문에 대한 나의 생각을 적어보세요."
                            hideKeyboard()
                            answerColor = Color.black.opacity(0.2)
                            cardHeight = UIScreen.main.bounds.height * 0.45
                            cardTextHeight = geometry.size.height * 0.2
                        })
                        .foregroundColor(answerText.count == 0
                            || answerText == "질문에 대한 나의 생각을 적어보세요."
                            ? Color.mainGreen.opacity(0.4)
                        : Color.mainGreen)
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                        .background(
                        RoundedRectangle(cornerRadius: 10))
                        .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("제출 완료"),
                            message: Text("마이페이지에서 확인할 수 있어요!"),
                            primaryButton: .default(Text("보러가기")),
                            secondaryButton: .cancel(Text("완료"), action: {
                                    tapTextEditor = false
                                }))
                    }
                        .padding(.top, 50)
                        .frame(width: geometry.size.width * 0.8, alignment: .trailing)
                }
                    .padding()
                    .background(LinearGradient(
                    gradient: Gradient(colors: [Color.primaryColor, Color.subIvory]),
                    startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)

                TextEditor(text: $answerText)
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.2)
                    .onTapGesture {
                    answerText = ""
                    answerColor = Color.black
                    cardHeight = geometry.size.height * 0.1
                    cardTextHeight = geometry.size.height * 0.1
                }
                    .foregroundColor(answerColor)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
                    .onChange(of: answerText) { value in
                    if answerText.count == 0 {
                        tapTextEditor = false
                    } else {
                        tapTextEditor = true
                    }
                }
            }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.backgroundColor.ignoresSafeArea())
                .onTapGesture {
                hideKeyboard()
                cardHeight = geometry.size.height * 0.45
                cardTextHeight = geometry.size.height * 0.2
            }
        }
    }

    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
