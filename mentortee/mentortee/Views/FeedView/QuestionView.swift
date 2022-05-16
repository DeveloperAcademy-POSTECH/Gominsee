import SwiftUI


// MARK: - 수정필요 GroupBox -> VStack 변경 후 삭제
struct QuestionCardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
            .background(RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        )
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

// MARK: - 수정필요 struct 페이지 분리 or 변수로 바꾸기
struct QuestionAnswerCard: View {
    // MARK: - 수정필요 (struct를 만들 수 있지 않을까?)
    var thumbnail: String
    var nickName: String
    var uploadTime: String
    var category: String
    var question: String

    var body: some View {
        // MARK: - 수정필요 GroupBox -> VStack
        GroupBox() {
            HStack() {
                HStack {
                    Image(thumbnail)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(nickName)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
                Spacer()
                Text(uploadTime)
                    .frame(alignment: .trailing)
                    .font(.system(size: 14))
            }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
            Divider()
                .padding(.horizontal, 15)
            VStack(alignment: .leading) {
                Text(category)
                    .font(.system(size: 14))
                    .padding(.bottom, 5)
                Text(question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)
            }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 30, trailing: 25))
        }.groupBoxStyle(QuestionCardStyle())
    }
}

struct QuestionView: View {
    var body: some View {
        VStack {
            QuestionAnswerCard(thumbnail: "thumbnail_lv1", nickName: "noel", uploadTime: "7시간 전", category: "취향", question: "무슨 색을 좋아하나요?")
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
