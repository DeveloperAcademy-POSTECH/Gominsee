import SwiftUI

// 유저가 dailyQuestion에 답한다면, 그 답변이 유저아이디로 분류되어서 내가답한 질문으로 들어간다. 

struct AnswerCardList: View {
    @State private var currentIdx: Category = .all
    @State private var showModal = false
    @EnvironmentObject var userInfo: UserInformation
    @EnvironmentObject var firestoreData: FireStoreManager
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.backgroundColor).ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
//                    AnswerCategoryButtonList()
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

    private func AnswerCategoryButtonList() -> some View {
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

//    private func AnswerCardList() -> some View {
//        ScrollView {
//            VStack{
//                ForEach(firestoreData.userAnswerList, id: \.self) { data in
//                    if currentIdx == .all {
//                        AnswerCard(questionData: data, currentIdx: currentIdx)
//                    } else if data.category.contains(currentIdx) {
//                        AnswerCard(questionData: data, currentIdx: currentIdx)
//                    }
//                }
//            }
//        }
//    }

    
}
