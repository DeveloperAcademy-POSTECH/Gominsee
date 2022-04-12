//
//  AnswerView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/06.
//

import SwiftUI

var showingOptions = false

struct AnswerView: View {
    @State private var showingOptions = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    
    var thumbnail: String
    var nickname: String
    var date: String
    var contents: String
    var myName: String = "meenu"
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(thumbnail).resizable().frame(width: 40, height: 40).padding(5)
                VStack(alignment: .leading) {
                    HStack {
                        Text(nickname).font(.system(size: 16)).bold()
                        Text(date).font(.system(size: 12)).foregroundColor(Color.gray)
                        Spacer()
                        Button(action: { showingOptions = true }) {
                            Image(systemName: "ellipsis")
                        }
                        .background(Rectangle().fill(Color.backgroundColor))
                        .foregroundColor(Color.black)
                        .rotationEffect(Angle(degrees: 90))
                        .confirmationDialog("행동 선택", isPresented: $showingOptions) {
                            if (myName == nickname) {
                                Button("수정하기") {
                                    print("수정하기")
                                    
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
                        .alert("정말 삭제하실 건가요?", isPresented: $showingDeleteAlert) {
                            Button("삭제할래요", role: .destructive) {}
                            Button("아니요", role: .cancel) {}
                        } message: {
                            Text("삭제하신 답변은 복구할 수 없어요 ㅠ^ㅠ      신중하게 생각하고 선택해주세요.")
                        }
                        .confirmationDialog("게시글 신고 사유를 선택해주세요", isPresented: $showingReportAlert, titleVisibility:.visible) {
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
                    }
                    .padding(.init(top: 15, leading: 15, bottom: 5, trailing: 15))
                    Text(contents).font(.system(size: 16)).padding([.leading, .bottom, .trailing], 15)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor))
            }
            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
        }
    }
}

struct Accordion: View {
    @State private var collapsed = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 60)
                ScrollView {
                    AnswerView(thumbnail: "thumbnail_lv1", nickname: "meenu", date: "1시간 전", contents: "노란색을 보면 기분이 좋아짐")
                    AnswerView(thumbnail: "thumbnail_lv2", nickname: "chemi", date: "2시간 전", contents: "보라색")
                    AnswerView(thumbnail: "thumbnail_lv3", nickname: "brown", date: "3시간 전", contents: "브라운")
                    AnswerView(thumbnail: "thumbnail_lv1", nickname: "noel", date: "4시간 전", contents: "보라색")
                    AnswerView(thumbnail: "thumbnail_lv3", nickname: "rookie", date: "5시간 전", contents: "주황색")
                    AnswerView(thumbnail: "thumbnail_lv2", nickname: "daon", date: "6시간 전", contents: "연두색")
                    Spacer().frame(height: 10)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? .infinity : 0)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.white))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            VStack {
                Button(action: { self.collapsed.toggle() }) {
                    HStack {
                        Text("9개의 생각이 있어요.").font(.system(size: 14)).foregroundColor(Color.black)
                        Spacer()
                        Image(systemName: collapsed ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                            .resizable().frame(width: 30, height: 30)
                            .foregroundColor(Color.mainGreen)
                    }
                    .padding(10)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                Spacer()
            }
        }
        .padding(.horizontal, 16.0)
    }
}

struct replyAnswer: View {
    @State private var checked = false
    @State var answer: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("질문에 대한 나의 생각을 적어주세요", text: $answer)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16))
                    .padding(.leading, 5.0)
                Button(action: {}) {
                    Image(systemName: "arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.primaryColor)
                }
                .padding(.trailing, 5.0).padding(.bottom, 3)
            }
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.backgroundColor))
            .padding(.horizontal, 10)
            Button (action: { self.checked.toggle() }) {
                HStack{
                    Image(systemName: checked ? "checkmark.circle.fill" : "checkmark.circle")
                        .foregroundColor(checked ? Color.mainGreen : Color.gray)
                    Text("내 생각 나만 볼래요")
                        .font(.system(size: 14))
                        .foregroundColor(checked ? Color.black : Color.gray)
                }
            }
            .padding(.leading, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: 85)
        .background(Rectangle()
            .fill(Color.white))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

struct AnswerDetailView: View {
    var body: some View {
        VStack {
            Accordion()
            replyAnswer()
        }
    }
}

struct AnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDetailView()
    }
}
