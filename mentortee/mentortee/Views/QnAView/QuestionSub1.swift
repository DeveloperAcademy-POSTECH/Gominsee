import SwiftUI

struct QuestionSub1: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                // MARK: - 수정완료
                Image.womanUser
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
                Text(TextName.uploadBoardText)
                    .font(.subheadline)
                
                NavigationLink(destination: QuestionCardView(firstNaviLinkActive: $firstNaviLinkActive)){
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

//
//struct QuestionSub1_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionSub1()
//    }
//}
