import SwiftUI

struct CommentView: View {
    var comment: Comment
    // TODO: Auth연동 후 User name으로 설정
    var myName: String = "meenu"
    @State private var isShowingOptions = false
    @State private var isShowingReportAlert = false
    @State private var isShowingDeleteAlert = false

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(comment.thumbnail)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(5)

                VStack(alignment: .leading) {
                    HStack {
                        Text(comment.nickname)
                            .font(.system(size: 16))
                            .bold()
                        Text(comment.date)
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                        Spacer()
                        Button(action: { isShowingOptions = true }) {
                            Image(systemName: IconName.ellipsis)
                        }
                            .background(Rectangle().fill(Color.backgroundColor))
                            .foregroundColor(.mainBlack)
                            .rotationEffect(Angle(degrees: 90))
                            .confirmationDialog(TextName.selectAct, isPresented: $isShowingOptions) {
                            if (myName == comment.nickname) {
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
                            .alert(TextName.checkDelete, isPresented: $isShowingDeleteAlert) {
                            Button(TextName.deleteIt, role: .destructive) { }
                            Button(TextName.noText, role: .cancel) { }
                        } message: {
                            Text(TextName.checkDeleteAnswerText)
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
                    Text(comment.contents)
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

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comment: Comment.all()[0])
    }
}
