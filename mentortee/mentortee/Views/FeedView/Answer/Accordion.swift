import SwiftUI

struct Accordion: View {
    @State private var collapsed = false
    @State private var answerList = AnswerView.all()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 60)
                
                ScrollView {
                    ForEach(answerList, id: \.nickname) { answer in
                        answer
                    }
                    Spacer().frame(height: 10)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? .infinity : 0)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            
            VStack {
                Button(action: { self.collapsed.toggle() }) {
                    HStack {
                        Text("6개의 생각이 있어요.")
                            .font(.system(size: 14))
                            .foregroundColor(Color.black)
                        Spacer()
                        Image(systemName: collapsed
                              ? "chevron.up.circle.fill"
                              : "chevron.down.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.mainGreen)
                    }
                    .padding(10)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                Spacer()
            }
        }
        .padding(.horizontal, 16.0)
    }
}

struct Accordion_Previews: PreviewProvider {
    static var previews: some View {
        Accordion()
    }
}
