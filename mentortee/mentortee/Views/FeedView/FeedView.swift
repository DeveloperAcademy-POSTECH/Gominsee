import SwiftUI

struct FeedView: View {
    @State var currentIdx = "전체"
    @State private var showModal = false
    @State var questionData = QuestionData.all()

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
                ForEach(CategoryBtn.allCases, id: \.self) { value in
                    Button(value.rawValue) {
                        currentIdx = value.rawValue
                    }
                        .frame(width: 60, height: 30, alignment: .center)
                        .foregroundColor(Color.white)
                        .background(RoundedRectangle(cornerRadius: 40)
                            .fill(currentIdx == value.rawValue ? Color.primaryColor : Color.gray))
                }
            }
        }
            .padding()
    }

    private func feedCategoryList() -> some View {
        ScrollView {
            VStack {
                ForEach(questionData, id: \.self) { data in
                    if currentIdx == "전체" {
                        QuestionCard(questionData: data, currentIdx: $currentIdx)
                    } else if currentIdx == data.category {
                        QuestionCard(questionData: data, currentIdx: $currentIdx)
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
