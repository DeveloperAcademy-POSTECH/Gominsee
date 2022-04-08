//
//  AnswerView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/06.
//

import SwiftUI

var answer: String = ""

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
                Image(systemName: thumbnail).resizable().frame(width: 28, height: 28).padding(5)
                VStack(alignment: .leading) {
                    HStack {
                        Text(nickname).font(.system(size: 16)).bold()
                        Text(date).font(.system(size: 12)).foregroundColor(Color.gray)
                        Spacer()
                        Button(action: { showingOptions = true }) {
                            Image(systemName: "ellipsis")
                        }.foregroundColor(Color.black).rotationEffect(Angle(degrees: 90))
                        
                    }.padding(.init(top: 15, leading: 15, bottom: 5, trailing: 15))
                    Text(contents).font(.system(size: 16)).padding([.leading, .bottom, .trailing], 15)
                }.frame(width: .infinity, alignment: .leading).background(RoundedRectangle(cornerRadius: 10).fill(Color.mint))
                
            }.padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                .confirmationDialog("동작 선택", isPresented: $showingOptions, titleVisibility: .hidden) {
                    if (myName == nickname) {
                        Button("수정하기") {
                            answer = contents
                        }
                        Button("삭제하기") {
                            showingDeleteAlert = true
                        }
                        .alert("정말 삭제하실 건가요?", isPresented: $showingDeleteAlert) {
                            Button("삭제할래요", role: .destructive) {}
                            Button("아니요", role: .cancel) {}
                        } message: {
                            Text("삭제하신 답변은 복구할 수 없어요 ㅠ^ㅠ      신중하게 생각하고 선택해주세요.")
                        }
                    }
                    else {
                        Button("신고하기", role: .destructive) {
                            showingReportAlert = true
                        }
                        .alert("정말 신고하실 건가요?", isPresented: $showingReportAlert) {
                            Button("신고할래요", role: .destructive) {}
                            Button("아니요", role: .cancel) {}
                        } message: {
                            TextField("신고 사유를 적어주세요.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
        }
    }
}

struct AnswerDetailView: View {
    @State private var collapsed: Bool = true
    @State private var checked: Bool = false
    @State private var rename: String = answer
    
    var myname: String = "meenu"
    
    var body: some View {
        VStack {
            VStack {
                ScrollView {
                    Spacer().frame(height: 65)
                    AnswerView(thumbnail: "person", nickname: "meenu", date: "1시간 전", contents: "노란색을 보면 기분이 좋아짐")
                    AnswerView(thumbnail: "person.fill", nickname: "chemi", date: "2시간 전", contents: "보라색")
                    AnswerView(thumbnail: "person.crop.circle", nickname: "brown", date: "3시간 전", contents: "브라운")
                    AnswerView(thumbnail: "person.crop.circle.fill", nickname: "noel", date: "4시간 전", contents: "보라색")
                    AnswerView(thumbnail: "person.circle", nickname: "rookie", date: "5시간 전", contents: "주황색")
                    AnswerView(thumbnail: "person.circle.fill", nickname: "daon", date: "6시간 전", contents: "연두색")
                    Spacer().frame(height: 15)
                }.overlay(
                    VStack {
                        Button(action: { self.collapsed.toggle() }) {
                        HStack {
                            Text("9개의 생각이 있어요")
                            Spacer()
                            Image(systemName: self.collapsed ? "chevron.down.circle.fill" : "chevron.up.circle.fill").foregroundColor(Color.green)
                        }.frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50).padding(.horizontal, 10)
                            Spacer()
                        }.background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top).foregroundColor(Color.black)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            }.background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .infinity).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0).padding(16)
            Spacer()
            VStack (alignment: .leading) {
                HStack {
                    TextField("질문에 대한 나의 생각을 적어주세요", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.leading, 10.0)
                    Button(action: {}) {
                        Image(systemName: "arrow.up.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.orange)
                    }.padding(.trailing, 10.0)
                }.frame(width: .infinity, height: 40).background(RoundedRectangle(cornerRadius: 20).fill(Color.gray)).padding(.horizontal, 16)
                HStack {
                    Button(action: { self.checked.toggle() }) {
                        Image(systemName: checked ? "checkmark.circle.fill" : "checkmark.circle").resizable().frame(width: 22, height: 22).foregroundColor(checked ? Color.green : Color.gray)
                        Text("내 생각 나만 볼래요").font(.system(size: 14)).foregroundColor(checked ? Color.black : Color.gray)
                    }
                }.padding(.leading, 16)
            }.background(Rectangle().fill(Color.white).frame(width: .infinity, height: 85)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        }
    }
}

struct AnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDetailView()
    }
}
