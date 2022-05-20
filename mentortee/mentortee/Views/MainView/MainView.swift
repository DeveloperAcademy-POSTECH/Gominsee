import SwiftUI

struct MainView: View {
    var dailyQuestion = "Chemi님은 뭘 할 때 행복한가요 ?"
    var categoryList = ["가치관"]
    @State private var answerText = TextName.answerText
    @State private var answerColor = Color.answerColor
    @State private var showAlert = false
    @State private var cardOpacity: Double = 1.0

    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: -10) {
                    dailyQuestionCard(geo: geo)
                    textEditor(geo: geo)
                }
                    .frame(width: geo.size.width)
                    .frame(minHeight: geo.size.height)
            }
                .background(Color.backgroundColor.ignoresSafeArea())
                .onTapGesture {
                hideKeyboard()
                cardOpacity = 1.0
            }
        }
    }

    private func dailyQuestionCard(geo: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            Text("\(Date(), formatter: dateFormatKR())")
                .dateTextStyle()
            Text(dailyQuestion)
                .dailyQuestionTextStyle()
                .minimumScaleFactor(0.5)
                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.2, alignment: .leading)

            HStack {
                ForEach(categoryList, id: \.self) { value in
                    Text(value)
                        .dailyCategoryTextStyle()
                        .dailyCategoryStyle()
                }
            }
            submitButton(geo: geo)
        }
            .dailyQuestionCardStyle(geo: geo)
            .opacity(cardOpacity)
    }

    private func submitButton(geo: GeometryProxy) -> some View {
        Button(TextName.submission, action: answerText.count == 0 || answerText == TextName.answerText ? { }: {
                onSubmitButton()
            })
            .dailySubmitButtonStyle(answerText: answerText, geo: geo)
            .alert(isPresented: $showAlert) {
            Alert(
                title: Text(TextName.completeSubmit),
                message: Text(TextName.checkMyPage),
                dismissButton: .default(Text(TextName.okText), action: { })
            )
        }
    }

    private func textEditor(geo: GeometryProxy) -> some View {
        TextEditor(text: $answerText)
            .dailyTextEditorStyle(geo: geo, answerColor: answerColor)
            .onTapGesture {
            if answerText == TextName.answerText {
                answerText = ""
            }
            answerColor = Color.mainBlack
            cardOpacity = 0.7
        }
    }

    private func onSubmitButton() {
        showAlert = true
        hideKeyboard()
        answerColor = Color.mainBlack.opacity(0.2)
        answerText = TextName.answerText
        cardOpacity = 1.0
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
