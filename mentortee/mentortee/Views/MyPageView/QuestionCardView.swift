import Foundation
import SwiftUI

struct QuestionCardView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var myData : UserInformation
    
    var body: some View {
        VStack {
            Text("총\(myData.myPageData.myQuestionCount)개")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16.0)
            ScrollView {
//                AnswerCardList()

            }
        }
        .background(Color.backgroundColor)
        .navigationTitle(TextName.myQuestionText)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
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
