import SwiftUI

// MARK: - 수정필요 (Card 완성 필요)
struct QuestionCard: View {
    var body: some View {
        VStack {
            HStack {
                Text(tempData.category)
                Spacer()
                // MARK: - 수정완료
                Image(systemName: IconName.ellipsis)
                    .rotationEffect(Angle(degrees: 90))
            }
            Text(tempData.question)
            Divider()
            HStack {
                Text("\(tempData.writer)의 질문")
                Spacer()
                NavigationLink(destination: Text("임시")
                    .navigationBarHidden(true)) {
                        Text("다른 생각 10개")
                    }
            }
        }
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0))
    }
}

struct BtnMyThought: View {
    @State var showModal = false
    var body: some View {
        Button(action: {
            self.showModal = true
        }, label: {
            Text("생각적기")
        })
        .padding(.all, 10)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.primaryColor)
            )
        .foregroundColor(Color.white)
        .sheet(isPresented: self.$showModal) {
            AnswerModalSheet(feedQuestion:  "ABCABC")
        }
        
        
        
//        Button(action: {
//            saveAnswer()
//            presentation.wrappedValue.dismiss()
//        }, label: {
//                Text("작성완료:)").bold()
//                    .frame(width: 310, height: 40, alignment: .center)
//            })
//            .frame(width: 310, height: 40, alignment: .center)
//            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryColor))
//            .font(.system(size: 16))
//            .foregroundColor(Color.white)
        
    }
}



struct QuestionCard_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCard()
    }
}
