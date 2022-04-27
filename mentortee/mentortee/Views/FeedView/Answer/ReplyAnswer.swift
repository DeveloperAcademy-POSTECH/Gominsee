import SwiftUI

struct ReplyAnswer: View {
    @State private var isChecked = false
    @State var answer: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("질문에 대한 나의 생각을 적어주세요", text: $answer)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .padding(.leading, 5.0)
                
                Button(action: {}) {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.primaryColor)
                }
                .padding(.init(top: 0, leading: 0, bottom: 3, trailing: 5))
            }
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor))
            .padding(.horizontal, 10)
            
            Button (action: { self.isChecked.toggle() }) {
                HStack{
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                        .foregroundColor(isChecked ? Color.mainGreen : Color.gray)
                    
                    Text("내 생각 나만 볼래요")
                        .font(.system(size: 14))
                        .foregroundColor(isChecked ? Color.black : Color.gray)
                }
            }
            .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: 85)
        .background(Rectangle().fill(Color.white))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

struct ReplyAnswer_Previews: PreviewProvider {
    static var previews: some View {
        ReplyAnswer()
    }
}
