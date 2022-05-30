import SwiftUI

struct QuestionCard: View {
    @State private var isReport = false
    @State private var isShowingConfirmation = false
    @State private var showModal = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    @State private var showQuestionDetailview = false
    @State var questionData: UserQuestion
    
    var currentIdx: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                categoryList()
                Spacer()
                showDetailButton()
            }
            .padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
            
            VStack(alignment: .leading) {
                questionInformation()
                lookMyThought()
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))
            
            Divider()
            
            HStack {
                whoseQuestion()
                Spacer()
                lookOthersThought()
            }
            .padding(.leading, 20)
        }
        .frame(width: 350, height: 200)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
    
    // Stack구조 끝 , 각 함수별 설명 시작
    private func categoryList() -> some View {
        ForEach(questionData.category, id: \.self) { value in
            Text(value.rawValue)
                .font(.system(size: 14))
                .foregroundColor(Color.gray)
        }
    }
    
    private func showDetailButton() -> some View {
        Button(action: {
            isShowingConfirmation = true
        }) {
            Image(systemName: IconName.ellipsis)
                .foregroundColor(.mainBlack)
                .rotationEffect(Angle(degrees: 90))
        }
        .confirmationDialog("수정/삭제", isPresented: $isShowingConfirmation) {
            // TODO: Auth연동 후 User name으로 설정
            if("브라운" == questionData.nickname) {
                Button("\(TextName.editText)") {
                }
                Button("\(TextName.deleteText)", role: .destructive) {
                    showingDeleteAlert = true
                }
            }
            else {
                Button("\(TextName.reportText)", role: .destructive) {
                    showingReportAlert = true
                }
            }
        }
        .alert("\(TextName.deleteBoard)", isPresented: $showingDeleteAlert) {
            Button("\(TextName.deleteText)", role: .destructive) { }
            Button("\(TextName.cancleText)", role: .cancel) { }
        } message: {
            Text("\(TextName.checkDeleteAnswerText)")
        }
        .confirmationDialog("\(TextName.selectReport)", isPresented: $showingReportAlert, titleVisibility: .visible) {
            ForEach(ReportDialog.allCases, id: \.self) { word in
                Button(word.rawValue) {
                    isReport = true
                }
            }
        }
        .alert("\(TextName.checkReport)", isPresented: $isReport) {
            Button("\(TextName.yesText)", role: .destructive) { }
            Button("\(TextName.noText)", role: .cancel) { }
        } message: {
            Text("\(TextName.checkReportText)")
        }
    }
    
    private func questionInformation() -> some View {
        Text(questionData.question)
            .foregroundColor(Color.mainBlack)
            .font(.system(size: 22))
            .fontWeight(.heavy)
            .lineSpacing(5)
            .minimumScaleFactor(0.4)
    }
    
    private func lookMyThought() -> some View {
        Button(action: {
            showModal = true
        }) {
            Text("\(TextName.writeThink)")
                .padding(5)
                .foregroundColor(.white)
                .background(Color.primaryColor)
                .cornerRadius(10)
        }
        .sheet(isPresented: self.$showModal) {
            AnswerModalSheet(feedQuestion: questionData.question)
        }
    }
    
    private func whoseQuestion() -> some View {
        HStack(spacing: 0) {
            Text(questionData.nickname)
                .bold()
                .foregroundColor(.mainBlack).opacity(0.9)
                .font(.system(size: 16))
            Text("의 질문")
                .foregroundColor(.mainBlack).opacity(0.9)
                .font(.system(size: 16))
        }
    }
    
    private func lookOthersThought() -> some View {
        NavigationLink(destination: QuestionCardDetailView(questionData: $questionData)) {
            Text(questionData.myThought)
                .padding()
        }
    }
    
}


// struct QuestionCard_Previews: PreviewProvider {
//     static var previews: some View {
//         QuestionCard(questionData: UserQuestion(id: "abc", nickname: "chemi", question: "오늘 점심은 뭘 드셨나요?", cateogory: [.all], uploadDate: Date(), myThought: "", isShared: false, isDeleted: false), currentIdx: .all)
//     }
// }

