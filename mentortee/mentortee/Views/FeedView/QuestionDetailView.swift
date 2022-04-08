//
//  QuestionDetailView.swift
//  mentortee
//
//  Created by Yu ahyeon on 2022/04/06.
//

import SwiftUI

struct QuestionDetailView: View {
    
    @State private var isShowingConfirmation = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
//    var nickname: String
//    var myName: String = "meenu"
    

    var body: some View {
        
        NavigationView {
            ZStack {
                       Color.backgroundColor
                           .ignoresSafeArea()
                        //배경색 영역
                VStack {
                    QuestionView().padding(.top, -40)
                    AnswerDetailView()
                    }
                .navigationBarItems(leading: Button(action: {
                    // 뒤로가기 기능이 들어가야함
                    }) { Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .foregroundColor(.black)
                    }, trailing: Button(action: {
                            isShowingConfirmation = true
                    }){Image(systemName: "ellipsis")
                                    .imageScale(.large)
                                    .foregroundColor(.black)
                                    .rotationEffect(Angle(degrees: 90))
                    })
                .confirmationDialog("동작 선택", isPresented: $isShowingConfirmation){
                        Button("수정하기") {
//                            NavigationLink(destination:MakingQuestion()){
//
//                            }
                            }
                    Button("삭제하기") {
                        self.showingDeleteAlert = true
                        }
                        .alert(isPresented: $showingDeleteAlert) {
                        Alert(title: Text("게시글을 삭제하시겠습니까?"), message: Text(""), primaryButton: .destructive(Text("Primary"), action: {
                                        // Some action
                                    }), secondaryButton: .cancel())
                    
//                        Button("신고하기", role: .destructive) {
//                                showingReportAlert = true
//                            }
//                            .alert("정말 신고하실 건가요?", isPresented: $showingReportAlert) {
//                                Button("신고할래요", role: .destructive) {}
//                                Button("아니요", role: .cancel) {}
//                            } message: {
//                                TextField("신고 사유를 적어주세요.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                           }

                        }//나중에 합칠때 수정 필요!(작성자:수정,삭제/ 비작성자 : 신고 기능)
                    }
            }
        }
    }
        
struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView()
    }
}
