import SwiftUI

struct AnswerCardList: View {
    @EnvironmentObject var firestoreData: FireStoreManager
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.backgroundColor).ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(firestoreData.userAnswerList, id: \.id) { data in
                        AnswerCard(answerData: data, currentIdx: Category.all)
                    }
                }
            }
        }
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
