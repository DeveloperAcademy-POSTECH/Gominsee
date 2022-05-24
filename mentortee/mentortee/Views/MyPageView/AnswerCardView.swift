import SwiftUI

struct CountAnswer: View {
    var body: some View {
        Text("총 3개").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16.0)
    }
}

struct FeedAnswerCardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            .padding(15)
    }
}

struct FeedAnswer: View {
    var category: String
    var otherThoughts: String
    var question: String
    var questionOwner: String
    @State var showModal = false
    @Environment(\.presentationMode) var presentation
    @State var testData = UserQuestion(id: "", nickname: "케미", question: "1", cateogory: [.aptitude], uploadDate: Date(), myThought: "")


    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text(category)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 5)
                }
                Spacer()
                Button(action: { }) {
                    // MARK: - 수정완료
                    Image(systemName: IconName.ellipsis)
                        .foregroundColor(.mainBlack)
                        .rotationEffect(Angle(degrees: 90))
                }
            }.padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))

            VStack(alignment: .leading) {
                Text(question)
                    .foregroundColor(.mainBlack)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)
                    .frame(minWidth: UIScreen.main.bounds.width * 0.8, alignment: .leading)

                Button(action: {
                    self.showModal = true
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.subLightGreen)
                        .frame(width: 100, height: 30)
                        .overlay(Text(TextName.showMyThink).foregroundColor(Color.white))
                }
                    .fullScreenCover(isPresented: self.$showModal) { MythoughtModalSheet() }
            }
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))

            Divider()
            HStack {
                HStack {
                    Text("\(questionOwner)의 질문")
                        .foregroundColor(.mainBlack)
                        .bold()
                        .font(.system(size: 16))
                }

                Spacer()

                NavigationLink(destination: QuestionCardDetailView(questionData: $testData)
                        .navigationBarHidden(true)) {
                    VStack {
                        // TODO: 색상 정하기
                        Text(otherThoughts)
                    }
                }
            }.padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
        }
            .background(RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct AnswerCardView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    CountAnswer()
                    ScrollView {
                        FeedAnswer(category: "회고",
                            otherThoughts: "다른 생각 10개",
                            question: "오늘 하루 하고(사고)싶었는데 못한 것이 있나요??",
                            questionOwner: "Brown")

                        FeedAnswer(category: "습관",
                            otherThoughts: "다른 생각 4개",
                            question: "아침에 일어나면 가장 먼저 무엇을 하시나요?",
                            questionOwner: "Meenu").padding(.vertical, 10)

                        FeedAnswer(category: "진로",
                            otherThoughts: "다른 생각 3개",
                            question: "진로를 선택한 순간을 떠올려보세요 선택에 영향을 준 요인은 무엇인가요?",
                            questionOwner: "Daon")
                    }
                }
                // MARK: - 수정완료
                .navigationBarTitle(TextName.myAnswerText, displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                    dismiss()
                }) {
                        // MARK: - 수정완료
                        Image(systemName: IconName.backward)
                            .font(.system(size: 20))
                            .foregroundColor(.mainBlack)
                    })
            }
        }
    }
}

struct AnswerCardView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCardView()
    }
}
