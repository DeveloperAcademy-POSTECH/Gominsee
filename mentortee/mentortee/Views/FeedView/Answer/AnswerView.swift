import SwiftUI

struct AnswerView: View {
    var thumbnail: String
    var nickname: String
    var date: String
    var contents: String
    var myName: String = "meenu"
    @State private var isShowingOptions = false
    @State private var isShowingReportAlert = false
    @State private var isShowingDeleteAlert = false
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(thumbnail)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(5)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(nickname)
                            .font(.system(size: 16))
                            .bold()
                        Text(date)
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Button(action: { isShowingOptions = true }) {
                            Image(systemName: "ellipsis")
                        }
                        .background(Rectangle().fill(Color.backgroundColor))
                        .foregroundColor(Color.black)
                            .rotationEffect(Angle(degrees: 90))
                        .confirmationDialog("행동 선택", isPresented: $isShowingOptions) {
                            if (myName == nickname) {
                                Button("수정하기") {
                                    print("수정하기")
                                }
                                Button("삭제하기", role: .destructive) {
                                    isShowingDeleteAlert = true
                                }
                            }
                            else {
                                Button("신고하기", role: .destructive) {
                                    isShowingReportAlert = true
                                }
                            }
                        }
                        .alert("정말 삭제하실 건가요?", isPresented: $isShowingDeleteAlert) {
                            Button("삭제할래요", role: .destructive) {}
                            Button("아니요", role: .cancel) {}
                        } message: {
                            Text("삭제하신 답변은 복구할 수 없어요 ㅠ^ㅠ      신중하게 생각하고 선택해주세요.")
                        }
                        .confirmationDialog("게시글 신고 사유를 선택해주세요",
                                            isPresented: $isShowingReportAlert,
                                            titleVisibility:.visible) {
                            ForEach(ReportDialog.allCases, id: \.self) { value in
                                Button(value.rawValue) {}
                            }
                        }
                    }
                    .padding(.init(top: 15, leading: 15, bottom: 5, trailing: 15))
                    Text(contents)
                        .font(.system(size: 16))
                        .padding([.leading, .bottom, .trailing], 15)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor))
            }
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
        }
    }
}
