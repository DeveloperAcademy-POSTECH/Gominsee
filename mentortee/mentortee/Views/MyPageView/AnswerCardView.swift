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
    

    var body: some View {
        GroupBox() {
            HStack {
                HStack {
                    Text(category)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 5)
                }
                Spacer()
                Button(action: { }) {
                    // MARK: - 수정필요
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                        .rotationEffect(Angle(degrees: 90))
                }
            }.padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))

            VStack(alignment: .leading) {
                Text(question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)

                Button(action: {
                    self.showModal = true
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.subLightGreen)
                        .frame(width: 100, height: 30)
                    // MARK: - 수정필요
                        .overlay(Text("내 생각 보기").foregroundColor(Color.white))
                }
                .fullScreenCover(isPresented: self.$showModal) { MythoughtModalSheet() }
            }
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))

            Divider()
            HStack {
                HStack {
                    // MARK: - 수정필요
                    Text(questionOwner)
                        .font(.system(size: 16)).bold()
                    Text("의 질문")
                        .font(.system(size: 16)).padding(.leading, -5)
                }

                Spacer()
                
                NavigationLink(destination: QuestionDetailView(nickname: "노엘")
                        .navigationBarHidden(true)) {
                    VStack {
                        Text(otherThoughts)
                    }
                }
            }.padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
        }.groupBoxStyle(QuestionCardStyle())
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
                // MARK: - 수정필요
                    .navigationBarTitle("내가 답한 질문", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                    dismiss()
                }) {
                    // MARK: - 수정필요
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
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
