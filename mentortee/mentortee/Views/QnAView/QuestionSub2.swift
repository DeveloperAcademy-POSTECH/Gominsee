import SwiftUI

struct QuestionSub2: View {
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                // MARK: - 수정필요
                Image("ManUser")
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
                Text("보관함에 내가 쓴 질문이 한개 더 쌓였네요!")
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

struct QuestionSub2_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSub2(firstNaviLinkActive: .constant(true))
    }
}
