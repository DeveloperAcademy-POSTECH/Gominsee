import Foundation
import SwiftUI

struct QuestionCardView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var myData : UserInformation
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        VStack {
            Text("총\(myData.myQuestionCount)개")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16.0)
            ScrollView {
//                QuestionCard(questionData: <#T##QuestionData#>, currentIdx: <#T##String#>)
//                QuestionCard(questionData: <#T##QuestionData#>, currentIdx: <#T##String#>)

            }
        }
        .background(Color.backgroundColor)
        .navigationTitle(TextName.myQuestionText)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    firstNaviLinkActive = false
                }) {
                    Image(systemName: IconName.backward)
                        .font(.system(size: 20))
                    .foregroundColor(.mainBlack)}
                
            }
            
        }
    }
}

//struct QuestionCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionCardView()
//    }
//}
