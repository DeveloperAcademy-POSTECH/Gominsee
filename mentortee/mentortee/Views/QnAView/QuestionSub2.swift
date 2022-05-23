import SwiftUI

struct QuestionSub2: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var firstNaviLinkActive: Bool

    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            VStack {
                Image.manUser
                    .resizable()
                    .frame(width: 200, height: 200)

                Text(TextName.completeText)
                    .font(.title2)
                    .padding()
                Text(TextName.oneStepYourself)
                    .font(.subheadline)
                Text(TextName.stackMyQuestion)
                    .font(.subheadline)
                
                NavigationLink(destination: QuestionCardView(firstNaviLinkActive: $firstNaviLinkActive)){
                    Text(TextName.goLocker)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    firstNaviLinkActive = true
                    dismiss()
                    
                }) {
                    Image(systemName: IconName.backward)
                        .font(.system(size: 20))
                    .foregroundColor(.mainBlack)}
            }
        }
    }
}
//struct QuestionSub2_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionSub2()
//    }
//}
