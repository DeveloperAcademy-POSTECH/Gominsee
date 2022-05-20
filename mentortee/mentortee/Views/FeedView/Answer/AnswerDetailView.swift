import SwiftUI

struct AnswerDetailView: View {
    @State private var collapsed = false
    @State private var isChecked = false
    @State private var commentList = Comment.all()
    @State var answer: String = ""

    var body: some View {
        VStack {
            accordion()
            replyAnswer()
        }
            .background(Color.backgroundColor.ignoresSafeArea())
    }

    private func accordion() -> some View {
        ZStack {
            VStack {
                Spacer().frame(height: 60)

                ScrollView {
                    ForEach(commentList, id: \.nickname) { comment in
                        CommentView(comment: comment)
                    }
                    Spacer().frame(height: 10)
                }
            }
                .frame(maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? .infinity : 0)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)

            VStack {
                Button(action: { self.collapsed.toggle() }) {
                    HStack {
                        Text("6개의 생각이 있어요.")
                            .font(.system(size: 14))
                            .foregroundColor(.mainBlack)
                        Spacer()
                        Image(systemName: collapsed
                                ? IconName.upArrow
                            : IconName.downArrow)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.mainGreen)
                    }
                        .padding(10)
                }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                Spacer()
            }
        }
            .padding(.horizontal, 16.0)
    }

    private func replyAnswer() -> some View {
        VStack(alignment: .leading) {
            HStack {
                TextField(TextName.answerText, text: $answer)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .padding(.leading, 5.0)
                Button(action: { }) {
                    Image(systemName: IconName.upArrowFill)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.primaryColor)
                }
                    .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 5))
            }
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor))
                .padding(.horizontal, 10)

            Button (action: { self.isChecked.toggle() }) {
                HStack {
                    Image(systemName: isChecked ? IconName.checkMarkCircleFill : IconName.checkMarkCircle)
                        .foregroundColor(isChecked ? Color.mainGreen : Color.gray)

                    Text(TextName.privateAnswer)
                        .font(.system(size: 14))
                        .foregroundColor(isChecked ? .mainBlack : Color.gray)
                }
            }
                .padding(.leading, 10)
        }
            .frame(maxWidth: .infinity, maxHeight: 85)
            .background(Rectangle().fill(Color.white))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

struct AnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDetailView()
    }
}
