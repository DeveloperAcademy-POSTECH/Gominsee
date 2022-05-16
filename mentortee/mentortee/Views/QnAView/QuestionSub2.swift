import SwiftUI

struct QuestionSub2: View {
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                // MARK: - 수정완료
                Image.manUser
                    .resizable()
                    .frame(width: 200, height: 200)

                // MARK: - 수정완료
                Text(TextName.completeText)
                    .font(.title2)
                    .padding()
                // MARK: - 수정완료
                Text(TextName.oneStepYourself)
                    .font(.subheadline)
                // MARK: - 수정완료
                Text(TextName.stackMyQuestion)
                    .font(.subheadline)

                NavigationLink(destination: QuestionCardView(firstNaviLinkActive: $firstNaviLinkActive)
                    .navigationBarHidden(true)){
                        // MARK: - 수정완료
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
    }
}

struct QuestionSub2_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSub2(firstNaviLinkActive: .constant(true))
    }
}
