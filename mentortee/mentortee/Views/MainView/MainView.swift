import SwiftUI
import FirebaseAuth

struct MainView: View {
    @EnvironmentObject var mainViewData : FireStoreManager
    @EnvironmentObject var userInfo : UserInformation
    @State private var answerText = TextName.answerText
    @State private var answerColor = Color.answerColor
    @State private var showAlert = false

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
            }
        }
    }

    private func dailyQuestionCard(geo: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            Text("\(Date(), formatter: dateFormatKR())")
                .dateTextStyle()
            Text(mainViewData.dailyQuestion.question)
                .dailyQuestionTextStyle()
                .minimumScaleFactor(0.5)
                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.2, alignment: .leading)

            HStack {
                ForEach(mainViewData.dailyQuestion.category, id: \.self) { value in
                    Text(value.rawValue)
                        .dailyCategoryTextStyle()
                        .dailyCategoryStyle()
                }
            }
            submitButton(geo: geo)
        }
            .dailyQuestionCardStyle(geo: geo)
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
        }
    }

    private func onSubmitButton() {
        showAlert = true
        hideKeyboard()
        answerColor = Color.mainBlack.opacity(0.2)

        mainViewData.userAnswerList.append(QuestionData(id: Auth.auth().currentUser?.uid ?? "", nickname: userInfo.myPageData.username, question: mainViewData.dailyQuestion.question, category: mainViewData.dailyQuestion.category, uploadDate: Date(), myThought: answerText))
        
        mainViewData.addDailyQuestionData(myAnswer: answerText)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserInformation())
            .environmentObject(FireStoreManager())
    }
}
