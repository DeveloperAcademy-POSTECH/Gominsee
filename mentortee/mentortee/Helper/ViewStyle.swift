import SwiftUI

extension View {
    func dailyCategoryStyle() -> some View {
        padding(.vertical, 3)
            .padding(.horizontal, 10)
            .background(RoundedRectangle(cornerRadius: 10))
    }

    func dailyQuestionCardStyle(geo: GeometryProxy) -> some View {
        padding()
            .foregroundColor(.white)
            .frame(width: geo.size.width * 0.87, height: geo.size.height * 0.6)
            .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [Color.primaryColor, Color.subIvory]),
                startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
    }

    func dailySubmitButtonStyle(answerText: String, geo: GeometryProxy) -> some View {
        padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .foregroundColor(answerText.count == 0 || answerText == TextName.answerText ? Color.mainGreen.opacity(0.4) : Color.mainGreen)
            .background(
            RoundedRectangle(cornerRadius: 10))
            .frame(width: geo.size.width * 0.8, alignment: .trailing)
            .padding(.top, 50)
    }

    func dailyTextEditorStyle(geo: GeometryProxy, answerColor: Color) -> some View {
        padding()
            .frame(width: geo.size.width * 0.87, height: geo.size.height * 0.25, alignment: .top)
            .foregroundColor(answerColor)
            .background(.white)
            .cornerRadius(10)
            .shadow(color: Color.mainBlack.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}
