import SwiftUI

struct FeedView: View {
    @State var currentIdx = "전체"
    @State private var showModal = false
    @State var questionData = QuestionData.all()

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.backgroundColor)
                        .ignoresSafeArea()
                    
                    VStack {
                        FeedCategoryBtn(currentIdx: $currentIdx)
                            .padding()
                        
                        ScrollView {
                            VStack {
                                ForEach(questionData, id:\.self) { data in
                                    if currentIdx == "전체" {
                                        QuestionCard(questionData: data, currentIdx: $currentIdx)
                                    } else if currentIdx == data.category {
                                        QuestionCard(questionData: data, currentIdx: $currentIdx)
                                    }
                                }
                            }
                        }.frame(height: geo.size.height * 0.88)
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
