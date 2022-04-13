//
//  QuestionCardView.swift
//  mentortee
//
//  Created by Jihye Hong on 2022/04/07.
//

import Foundation
import SwiftUI

struct CountQuestion: View {
    var body: some View {
        Text("총 n개").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16.0)
    }
}

struct FeedQuestionCardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
            .padding(15)
    }
}

struct FeedQuestion: View {
    var category: String
    var otherThoughts: String
    var question: String
    var questionOwner: String
    var nickname: String
    var myName: String = "meenu"
    @State var showModal = false
    @State var showQuestionDetailview = false
    @State private var isShowingConfirmation = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false

    var body: some View {
        GroupBox() {
            HStack {
                HStack {
                    Text(category)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 5)
                }
                Spacer()
                Button(action: {
                    isShowingConfirmation = true
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                        .rotationEffect(Angle(degrees: 90))
                }
                    .confirmationDialog("동작 선택", isPresented: $isShowingConfirmation) {
                    if(myName == nickname) {
                        Button("수정하기") {
                        }
                        Button("삭제하기", role: .destructive) {
                            self.showingDeleteAlert = true
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
                    Text("게시글을 삭제하시면 복구할 수 없어요ㅠ^ㅠ 신중하게 생각하고 선택해주세요.")
                }
                    .confirmationDialog("게시글 신고 사유를 선택해주세요", isPresented: $showingReportAlert, titleVisibility: .visible) {
                    Button("스팸") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("성적인 발언") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("마음에 들지 않습니다") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("혐오 발언") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("사기 또는 거짓") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("따돌림 또는 괴롭힘") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("폭력 또는 위험한 단체") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("지식 재산권 침해") {
                        //신고 누르면 카운트 기능?
                    }
                    Button("기타") {
                        //신고 누르면 카운트 기능?
                    }
                }
            }.padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))

            VStack(alignment: .leading) {
                Text(question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)

                Button(action: {
                    self.showModal = true
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.primaryColor)
                        .frame(width: 80, height: 30)
                        .overlay(Text("생각 적기").foregroundColor(Color.white))
                }
                    .fullScreenCover(isPresented: self.$showModal) {
                    AnswerModalSheet(feedQuestion: question)
                }
            }
                .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))
            Divider()

            HStack {
                HStack {
                    Text(questionOwner)
                        .font(.system(size: 16)).bold()
                    Text("의 질문")
                        .font(.system(size: 16)).padding(.leading, -5)
                }

                Spacer()
                NavigationLink(destination: QuestionDetailView(nickname: "노엘")
                        .navigationBarHidden(true)) {
                    VStack {
                        Text(otherThoughts)
                    }
                }
            }.padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
        }.groupBoxStyle(QuestionCardStyle())
    }
}

struct QuestionCardView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                VStack {
                    CountQuestion()
                    ScrollView {
                        FeedQuestion(category: "가치관",
                            otherThoughts: "다른 생각 9개",
                            question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                            questionOwner: "Chemi",
                            nickname: "Chemi"
                        )
                    }
                }
                    .navigationBarTitle("내가 한 질문", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        firstNaviLinkActive = false
                }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    })
            }
        }
    }
}

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView(firstNaviLinkActive: .constant(true))
    }
}
