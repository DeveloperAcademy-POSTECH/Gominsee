import SwiftUI

struct QuestionSub1: View {
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {

            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    // MARK: - 수정필요
                    Image("WomanUser")
                        .resizable()
                        .frame(width: 200, height: 200)

                    // MARK: - 수정필요
                    Text("작성 완료!")
                        .font(.title2)
                        .padding()
                    // MARK: - 수정필요
                    Text("스스로에게 한발짝 더 다가갔군요?")
                        .font(.subheadline)
                    // MARK: - 수정필요
                    Text("게시판에 내가 쓴 질문이 올라갔어요!")
                        .font(.subheadline)

                    NavigationLink(destination: QuestionCardView(firstNaviLinkActive: $firstNaviLinkActive)
                        .navigationBarHidden(true)){
                            // MARK: - 수정필요
                        Text("보관함으로 가볼래요?")
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


struct QuestionSub1_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSub1(firstNaviLinkActive: .constant(true))
    }
}
