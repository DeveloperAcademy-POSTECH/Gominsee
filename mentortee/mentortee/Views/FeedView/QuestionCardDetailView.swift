import SwiftUI

struct QuestionCardDetailView: View {
    @State private var isShowingConfirmation = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    @State private var showDialog = false
    @Environment(\.dismiss) private var dismiss
    @Binding var questionData: UserQuestion

    // TODO: Auth 연동 후 User name으로 설정
    //    var myName: String = "meenu"
    var body: some View {
        VStack {
            QuestionAnswerCard(questionData: $questionData)
            AnswerDetailView()
        }
        .onTapGesture {
            hideKeyboard()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.backgroundColor.ignoresSafeArea())
        .navigationBarItems(leading: Button(action: {
            dismiss()
        }) {
            Image(systemName: IconName.backward)
                .imageScale(.large)
                .foregroundColor(.mainBlack)
        }, trailing: Button(action: {
            isShowingConfirmation = true
        }) {
            Image(systemName: IconName.ellipsis)
                .imageScale(.large)
                .foregroundColor(.mainBlack)
                .rotationEffect(Angle(degrees: 90))
        }
            .confirmationDialog(TextName.selectAct, isPresented: $isShowingConfirmation) {
                // TODO: Auth연동 후 User name으로 설정
                if("케미" == questionData.nickname) {
                    Button(TextName.editText) {
                    }
                    Button(TextName.deleteText, role: .destructive) {
                        self.showingDeleteAlert = true
                    }
                }
                else {
                    Button(TextName.reportText, role: .destructive) {
                        showingReportAlert = true
                    }
                }
            }
            .alert(TextName.deleteBoard, isPresented: $showingDeleteAlert) {
                Button(TextName.deleteText, role: .destructive) { }
                Button(TextName.cancleText, role: .cancel) { }
            } message: {
                Text(TextName.chectDeleteContentText)
            }
            .confirmationDialog(TextName.selectReport, isPresented: $showingReportAlert, titleVisibility: .visible) {
                ForEach(ReportDialog.allCases, id: \.self) { value in
                    Button(value.rawValue) { }
                }
            }
        )
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardDetailView(questionData: .constant(UserQuestion.all()[0]))
    }
}
