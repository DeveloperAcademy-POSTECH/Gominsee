import SwiftUI

struct AnswerView: View {
    var thumbnail: String
    var nickname: String
    var date: String
    var contents: String
    // MARK: - 수정필요 (이전 View에서 전달하는 형식으로 변경)
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
                            // MARK: - 수정완료
                            Image(systemName: IconName.ellipsis)
                        }
                            .background(Rectangle().fill(Color.backgroundColor))
                            .foregroundColor(.mainBlack)
                            .rotationEffect(Angle(degrees: 90))
                        // MARK: - 수정완료
                        .confirmationDialog(TextName.selectAct, isPresented: $isShowingOptions) {
                            if (myName == nickname) {
                                Button(TextName.editText) { }
                                Button(TextName.deleteText, role: .destructive) {
                                    isShowingDeleteAlert = true
                                }
                            }
                            else {
                                Button(TextName.reportText, role: .destructive) {
                                    isShowingReportAlert = true
                                }
                            }
                        }
                        // MARK: - 수정완료
                        .alert(TextName.checkDelete, isPresented: $isShowingDeleteAlert) {
                            Button(TextName.deleteIt, role: .destructive) { }
                            Button(TextName.noText, role: .cancel) { }
                        } message: {
                            Text(TextName.checkDeleteText)
                        }
                            .confirmationDialog(TextName.selectReport,
                            isPresented: $isShowingReportAlert,
                            titleVisibility: .visible) {
                            ForEach(ReportDialog.allCases, id: \.self) { value in
                                Button(value.rawValue) { }
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
