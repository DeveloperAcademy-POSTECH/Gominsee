import SwiftUI

struct DailyQuestionTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 35).bold())
            .minimumScaleFactor(0.5)
    }
}

extension View {
    func dailyQuestion() -> some View {
        modifier(DailyQuestionTextStyle())
    }

    func dailyCategoryStyle() -> some View {
        padding(.vertical, 3)
            .padding(.horizontal, 10)
            .foregroundColor(Color.primaryColor)
            .background(RoundedRectangle(cornerRadius: 10))
            .font(.system(size: 14))
    }
}
