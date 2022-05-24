//import SwiftUI
//
//struct QuestionSub1: View {
//    @Binding var firstNaviLinkActive: Bool
//
//    var body: some View {
//
//        ZStack {
//            Color.backgroundColor
//                .ignoresSafeArea()
//
//            VStack {
//                Image.womanUser
//                    .resizable()
//                    .frame(width: 200, height: 200)
//                Text(TextName.completeText)
//                    .font(.title2)
//                    .padding()
//                Text(TextName.oneStepYourself)
//                    .font(.subheadline)
//                Text(TextName.uploadBoardText)
//                    .font(.subheadline)
//
//                NavigationLink(destination: QuestionCardView(firstNaviLinkActive: $firstNaviLinkActive)
//                        .navigationBarHidden(true)) {
//                    Text(TextName.goLocker)
//                        .bold()
//                        .font(.title3)
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 40)
//                        .padding(.vertical, 10)
//                        .background(Color.primaryColor)
//                        .cornerRadius(10)
//                }
//            }
//        }
//    }
//}
//
//
//struct QuestionSub1_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionSub1(firstNaviLinkActive: .constant(true))
//    }
//}
