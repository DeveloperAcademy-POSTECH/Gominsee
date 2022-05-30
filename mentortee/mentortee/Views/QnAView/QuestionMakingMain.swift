import SwiftUI
import FirebaseAuth

struct QuestionMakingMain: View {
    @State private var myQuestion: String = TextName.freeAnythingText
    @State private var myThought: String = TextName.freeAnythingText
    @State private var isShare = false
    @State private var myQuestionColor = Color.mainBlack.opacity(0.2)
    @State private var myThoughtColor = Color.mainBlack.opacity(0.2)
    @EnvironmentObject var userInfo: UserInformation
    @EnvironmentObject var firestoreData: FireStoreManager
    @State private var isDone: Bool = false
    @State private var isDoneAlert = false

    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height

    @State private var selection: Set<Category> = []
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                guideText()
                selecteCategory()
                questionField()
                thoughtGuideText()
                thoughtField()
                sharedMyThought()
            }
                .padding()
                .onTapGesture {
                hideKeyboard()
            }
                .alert(isPresented: $isDoneAlert) {
                Alert(title: Text(TextName.addQuestionText), dismissButton: .default(Text(TextName.okText), action: {
                            dismiss()
                        }))
            }
                .navigationBarTitle(Text(TextName.makeQuestion), displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                    Image(systemName: IconName.backward)
                        .font(.system(size: 20))
                        .foregroundColor(.mainBlack)
                },
        // 버튼을 누를 시에,
                trailing: Button(action: {
                    firestoreData.userQuestionList.append(UserQuestion(id: Auth.auth().currentUser?.uid ?? "", nickname: userInfo.myPageData.username, question: myQuestion, category: selection.map { $0 }, uploadDate: Date(), myThought: ""))
                    firestoreData.addUserQuestionData(questionData: UserQuestion(id: Auth.auth().currentUser?.uid ?? "", nickname: userInfo.myPageData.username, question: myQuestion, category: selection.map { $0 }, uploadDate: Date(), myThought: ""))
                    isDoneAlert = true
                }, label: {
                        Text(TextName.okText)
                    })
            )
        }
    }

    func showingAlert(isDoneAlert: Bool) -> some View {
        alert(isPresented: $isDoneAlert) {
            Alert(title: Text(TextName.addQuestionText), dismissButton: .default(Text(TextName.okText), action: {
                        dismiss()
                    }))
        }
    }

    func checkSelection(category: Category) {
        if selection.contains(category) {
            selection.remove(category)
        } else {
            selection.insert(category)
        }
    }

    private func guideText() -> some View {
        Text(TextName.guideQuesition)
            .bold()
            .font(.system(size: 24))
            .foregroundColor(.mainBlack)
            .padding(.top, 30)
    }

    private func selecteCategory() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases, id: \.self) { category in
                    if category != .all {
                        Button(action: {
                            checkSelection(category: category)
                        }, label: {
                                Text(category.rawValue)
                                    .categoryTextStyle()
                                    .frame(width: 60, height: 35, alignment: .center)
                            })
                            .categoryButtonStyle()
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(selection.contains(category) ? Color.primaryColor : Color.gray))
                    }
                }
            }
        }
            .padding(.bottom, 10)
    }

    private func questionField() -> some View {
        TextEditor(text: $myQuestion)
            .padding(EdgeInsets(top: 5, leading: 8, bottom: 10, trailing: 25))
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 0.2)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            .foregroundColor(myQuestionColor)
            .onTapGesture {
            // MARK: - 수정필요

            if myQuestion == TextName.freeAnythingText {
                myQuestion = ""
                myQuestionColor = .mainBlack
            } else {
                hideKeyboard()
            }
        }
    }

    private func thoughtGuideText() -> some View {
        Text("작성해주신 질문에 대한\nChemi님의 생각은 어떠신가요?")
            .bold()
            .font(.system(size: 24))
            .foregroundColor(.mainBlack)
    }

    private func thoughtField() -> some View {
        TextEditor(text: $myThought)
            .padding(EdgeInsets(top: 5, leading: 8, bottom: 10, trailing: 25))
            .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 0.2)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            .foregroundColor(myThoughtColor)
            .onTapGesture {
            if myThought == TextName.freeAnythingText {
                myThought = ""
                myThoughtColor = .mainBlack
            } else {
                hideKeyboard()
            }
        }
    }

    private func sharedMyThought() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(TextName.checkShareMyThink)
                    .foregroundColor(.mainBlack)
                    .font(.system(size: 24))
                    .bold()
                Text(TextName.openMyThink)
                    .foregroundColor(.mainBlack)
                    .font(.subheadline)
                    .padding(.top, -5)
            }
            Toggle("", isOn: $isShare)
                .frame(width: screenWidth1 * 0.3, height: screenHeight1 * 0.1)
                .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
        }
    }
}

struct QuestionMakingMain_Previews: PreviewProvider {
    @State var firstNaviLinkActive: Bool
    static var previews: some View {
        QuestionMakingMain()
    }
}
