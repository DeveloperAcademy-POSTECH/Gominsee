import Foundation
import SwiftUI

struct CountQuestion: View {
    var body: some View {
        Text("총 2개").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16.0)
    }
}

struct FeedQuestionCardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            .padding(15)
    }
}

struct QuestionCardView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var firstNaviLinkActive: Bool

    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    CountQuestion()
                    ScrollView {
                        QuestionCard(category: "취미",
                            otherThoughts: "다른 생각 0개",
                            question: "좋아하는 운동은 무엇인가요?",
                            questionOwner: "Chemi",
                            nickname: "Chemi"
                        ).padding(.bottom, 10)

                        FeedAnswer(category: "가치관",
                            otherThoughts: "다른 생각 5개",
                            question: "하루 중 가장 행복하다고 느끼는 순간은 언제인가요?",
                            questionOwner: "Chemi")
                    }
                }
                // MARK: - 수정완료
                .navigationBarTitle(TextName.myQuestionText, displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                    dismiss()
                    firstNaviLinkActive = false
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

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(firstNaviLinkActive: .constant(true))
    }
}
