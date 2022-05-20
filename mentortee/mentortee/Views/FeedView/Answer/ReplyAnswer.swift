//import SwiftUI
//
//struct ReplyAnswer: View {
//    @State private var isChecked = false
//    @State var answer: String = ""
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                // MARK: - 수정완료
//                TextField(TextName.answerText, text: $answer)
//                    .multilineTextAlignment(.leading)
//                    .font(.system(size: 16))
//                    .padding(.leading, 5.0)
//                // MARK: - 수정완료
//                Button(action: {}) {
//                    Image(systemName: IconName.upArrowFill)
//                        .resizable()
//                        .frame(width: 30, height: 30)
//                        .foregroundColor(Color.primaryColor)
//                }
//                .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 5))
//            }
//            .background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor))
//            .padding(.horizontal, 10)
//
//            Button (action: { self.isChecked.toggle() }) {
//                HStack{
//                    // MARK: - 수정완료
//                    Image(systemName: isChecked ? IconName.checkMarkCircleFill : IconName.checkMarkCircle)
//                        .foregroundColor(isChecked ? Color.mainGreen : Color.gray)
//
//                    // MARK: - 수정완료
//                    Text(TextName.privateAnswer)
//                        .font(.system(size: 14))
//                        .foregroundColor(isChecked ? .mainBlack : Color.gray)
//                }
//            }
//            .padding(.leading, 10)
//        }
//        .frame(maxWidth: .infinity, maxHeight: 85)
//        .background(Rectangle().fill(Color.white))
//        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
//    }
//}
//
//struct ReplyAnswer_Previews: PreviewProvider {
//    static var previews: some View {
//        ReplyAnswer()
//    }
//}
