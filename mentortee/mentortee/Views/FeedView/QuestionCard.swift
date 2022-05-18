import SwiftUI

struct QuestionCard: View {
    @Binding var currentIdx: String
    var category: String
    var otherThoughts: String
    var question: String
    var questionOwner: String
    var nickname: String
    var myName: String = "케미"
    var alarmList = ["스팸", "성적인 발언","혐오 발언","사기 또는 거짓","따돌림 또는 괴롭힘","폭력 또는 위험한 단체","지식 재산권 침해", "기타"]
    
    @State private var showModal = false
    @State private var isReport = false
    @State private var showQuestionDetailview = false
    @State private var isShowingConfirmation = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(category)
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                
                Spacer()

                Button(action: {
                    isShowingConfirmation = true
                }) {
                    Image(systemName: IconName.ellipsis)
                        .foregroundColor(Color.black)
                        .rotationEffect(Angle(degrees: 90))
                }
                .confirmationDialog("수정/삭제", isPresented: $isShowingConfirmation) {
                    if(myName == nickname) {
                        Button("수정하기") {
                        }
                        Button("삭제하기", role: .destructive) {
                            showingDeleteAlert = true
                        }
                    }
                    else {
                        Button("신고하기", role: .destructive) {
                            showingReportAlert = true
                        }
                    }
                }
                .alert("게시글을 삭제하시겠습니까?", isPresented: $showingDeleteAlert) {
                    Button("삭제", role: .destructive) { }
                    Button("취소", role: .cancel) { }
                } message: {
                    Text("게시글을 삭제하시면 복구할 수 없어요! 신중하게 생각하고 선택해주세요.")
                }
                .confirmationDialog("게시글 신고 사유를 선택해주세요", isPresented: $showingReportAlert, titleVisibility: .visible) {
                    ForEach(alarmList, id: \.self) { word in
                        Button(word){
                            isReport = true
                        }
                    }
                }
                .alert("정말 신고하시겠습니까?", isPresented: $isReport) {
                    Button("네", role: .destructive) { }
                    Button("아니오", role: .cancel) { }
                } message: {
                    Text("한번 신고가 접수되면 돌이킬 수 없어요. 신중하게 생각해주세요.")
                }
            }
            .padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
            
            VStack(alignment: .leading) {
                Text(question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)
                
                Button(action: {
                    showModal = true
                }) {
                    Text("생각적기")
                        .padding(5)
                        .foregroundColor(.white)
                        .background(Color.primaryColor)
                        .cornerRadius(10)
                }
                .sheet(isPresented: self.$showModal) {
                    AnswerModalSheet(feedQuestion: question)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))
            
            Divider()
            
            HStack {
                HStack(spacing: 0) {
                    Text(questionOwner)
                        .font(.system(size: 16)).bold()
                    Text("의 질문")
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                NavigationLink(destination: QuestionDetailView(nickname: "노엘")
                    .navigationBarHidden(true)) {
                        VStack {
                            Text(otherThoughts)
                                .padding()
                        }
                    }
            }
            .padding(.leading,20)
        }
        .frame(width: 350, height: 200)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}



struct QuestionCard_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCard(category: "가치관", otherThoughts: "다른생각", question: "오늘은 어떤 음식을 먹을까요", questionOwner: "브라운", nickname: "브라운")
    }
}
