import SwiftUI

struct QuestionMakingMain: View {
    @State private var isShare = false
    @State private var myQuestion: String = "무엇이든지 자유롭게 적어주세요!"
    @State private var myThought: String = "무엇이든지 자유롭게 적어주세요!"
    @State private var myQuestionColor = Color.black.opacity(0.2)
    @State private var myThoughtColor = Color.black.opacity(0.2)
    @Binding var firstNaviLinkActive: Bool

    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height

    @State private var selection: Set<Category> = []
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    // MARK: - 수정완료 (한 Text로 수정)
                    Text(TextName.guideQuesition)
                        .font(.system(size: 24))
                        .bold()
                        .padding(.top, 30)

                    ScrollView(.horizontal,
                        showsIndicators: false) {
                        HStack {
                            ForEach(Category.allCases, id: \.self) { category in
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
                        .padding(.bottom, 10)

                    TextEditor(text: $myQuestion)
                        .padding(EdgeInsets(top: 5, leading: 8, bottom: 10, trailing: 25))
                        .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 0.2)
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
                        .foregroundColor(myQuestionColor)
                        .onTapGesture {
                            // MARK: - 수정필요
                            if myQuestion == TextName.freeAnythingText {
                            myQuestion = ""
                            myQuestionColor = Color.black
                        } else {
                            hideKeyboard()
                        }
                    }

                    Text("작성해주신 질문에 대한")
                        .font(.system(size: 24))
                        .bold()

                    // MARK: - 수정필요 (닉네임 변수로 변경)
                    Text("Chemi님의 생각은 어떠신가요?")
                        .font(.system(size: 24))
                        .bold()

                    TextEditor(text: $myThought)
                        .padding(EdgeInsets(top: 5, leading: 8, bottom: 10, trailing: 25))
                        .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 0.2)
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
                        .foregroundColor(myThoughtColor)
                        .onTapGesture {
                            // MARK: - 수정완료
                            if myThought == TextName.freeAnythingText {
                            myThought = ""
                            myThoughtColor = Color.black
                        } else {
                            hideKeyboard()
                        }
                    }

                    HStack {
                        VStack(alignment: .leading) {
                            Text(TextName.checkShareMyThink)
                                .font(.system(size: 24))
                                .bold()
                            Text(TextName.openMyThink)
                                .font(.subheadline)
                                .padding(.top, -5)
                        }
                        Toggle("", isOn: $isShare)
                            .frame(width: screenWidth1 * 0.3, height: screenHeight1 * 0.1)
                            .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
                    }
                }
            }
                .padding()
                .onTapGesture {
                hideKeyboard()
            }
                .navigationBarTitle(Text(TextName.makeQuestion), displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                // MARK: - 수정완료
                Image(systemName: IconName.backward)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                },
                trailing: NavigationLink(destination: getDestination()
                        .navigationBarBackButtonHidden(true)
                )
                {
                    Text(TextName.okText)
                }
            )
                .onTapGesture {
                hideKeyboard()
            }
        }
    }

    func checkSelection(category: Category) {
        if selection.contains(category) {
            selection.remove(category)
        } else {
            selection.insert(category)
        }
    }

    func getDestination() -> AnyView {
        if (isShare == true) {
            return AnyView(QuestionSub1(firstNaviLinkActive: $firstNaviLinkActive)
                    .navigationBarHidden(true))
        }
        else {
            return AnyView(QuestionSub2(firstNaviLinkActive: $firstNaviLinkActive)
                    .navigationBarHidden(true))
        }
    }
}

struct QuestionMakingMain_Previews: PreviewProvider {
    @State var firstNaviLinkActive: Bool
    static var previews: some View {
        QuestionMakingMain(firstNaviLinkActive: .constant(true))
    }
}
