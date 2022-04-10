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
    var nickname: String
    var myName: String = "meenu"
    

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
                        if(myName == nickname){
                        Button("수정하기") {
                            //수정하기페이지로 이동
                            //NavigationLink(destination:MakingQuestion())
                                }
                        Button("삭제하기", role: .destructive) {
                            self.showingDeleteAlert = true
                            }
                    }else{
                        Button("신고하기", role: .destructive) {
                                    showingReportAlert = true
                                }
                        }
                               }.alert("게시글을 삭제하시겠습니까?", isPresented: $showingDeleteAlert) {
                                   Button("삭제", role: .destructive) {}
                                   Button("취소", role: .cancel) {}
                               } message: {
                                   Text("게시글을 삭제하시면 복구할 수 없어요ㅠ^ㅠ 신중하게 생각하고 선택해주세요.")
                                    }
                               .alert("게시글을 신고하시겠습니까?", isPresented: $showingReportAlert){
                                   Button("신고", role: .destructive) {}
                                   Button("취소", role: .cancel) {}
                               } message: {
                                   Text("신고사유를 입력해주세요")
                               }
                            }
            }
        }
    }
        
struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(nickname: "noel")
    }
}
