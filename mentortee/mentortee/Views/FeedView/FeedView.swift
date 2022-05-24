import SwiftUI

struct FeedView: View {
    @State var currentIdx: Category = .all
    @State private var showModal = false
    @EnvironmentObject var userInfo: UserInformation
    @EnvironmentObject var firestoreData: FireStoreManager

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                VStack {
                    feedCategoryButtonList()
                    feedCategoryList()
                        .frame(height: geo.size.height * 0.88)
                }
                    .background(Color.backgroundColor.ignoresSafeArea())
            }
        }
    }

    private func feedCategoryButtonList() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Category.allCases, id: \.self) { value in
                    Button(value.rawValue) {
                        currentIdx = value
                    }
                        .frame(width: 60, height: 30, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 40)
                            .fill(currentIdx == value ? Color.primaryColor : Color.gray))
                }
            }
        }
            .padding()
    }

    private func feedCategoryList() -> some View {
        ScrollView {
            VStack {
                ForEach(firestoreData.userQuestionList, id: \.id) { data in
                    if currentIdx == .all {
                        QuestionCard(questionData: data, currentIdx: currentIdx)
                    } else if data.cateogory.contains(currentIdx) {
                        QuestionCard(questionData: data, currentIdx: currentIdx)
                    }
                }
            }
        }
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
