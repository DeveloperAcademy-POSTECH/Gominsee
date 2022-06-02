import SwiftUI

struct AnswerCardList: View {
    @EnvironmentObject var firestoreData: FireStoreManager

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
    }
}
