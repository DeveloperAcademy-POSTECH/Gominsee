import SwiftUI

struct QuestionAnswerCard: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var questionData: UserQuestion

    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                HStack {
                    Image("thumbnail_lv1")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(questionData.nickname)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
                Spacer()
                // TODO: 시간 계산 필요
                Text(questionData.uploadDate, formatter: dateFormatKR())
                    .frame(alignment: .trailing)
                    .font(.system(size: 14))
            }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
            Divider()
                .padding(.horizontal, 15)
            VStack(alignment: .leading) {
                ForEach(questionData.cateogory, id: \.self) { value in
                    Text(value.rawValue)
                        .font(.system(size: 14))
                        .padding(.bottom, 5)
                }
                Text(questionData.question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .frame(minWidth: UIScreen.main.bounds.width * 0.8, alignment: .leading)
                    .lineSpacing(5)
            }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 30, trailing: 25))
        }
            .background(RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

struct QuestionAnswerCard_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerCard(questionData: .constant(UserQuestion.all()[1]))
    }
}
