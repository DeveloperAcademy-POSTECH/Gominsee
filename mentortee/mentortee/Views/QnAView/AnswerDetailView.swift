//
//  AnswerView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/06.
//

import SwiftUI

struct AnswerView: View {
    var thumbnail: String
    var nickname: String
    var date: String
    var contents: String
    var myname: String = "brown"
    @State private var showingOptions = false
    
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
                        }.foregroundColor(Color.black)
                    }.padding(.init(top: 10, leading: 10, bottom: 5, trailing: 10))
                    Text(contents).font(.system(size: 16)).padding([.leading, .bottom, .trailing], 10)
                }.frame(width: .infinity, alignment: .leading).background(RoundedRectangle(cornerRadius: 10).fill(Color.mint))
            }.padding(.init(top: 15, leading: 10, bottom: 0, trailing: 10))
                .confirmationDialog("동작 선택", isPresented: $showingOptions, titleVisibility: .hidden) {
                    if (myname == nickname) {
                        Button("수정하기") {
                        }
                        Button("삭제하기") {
                        }
                    }
                    else {
                        Button("신고하기", role: .destructive) {
                            
                        }
                    }
                }
        }
    }
}

struct AnswerDetailView: View {
    @State private var collapsed: Bool = true
    var myname: String = "meenu"
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                VStack {
                    Button(action: { self.collapsed.toggle() }) {
                        HStack {
                            Text("9개의 생각이 있어요")
                            Image(systemName: self.collapsed ? "chevron.down.circle.fill" : "chevron.up.circle.fill").foregroundColor(Color.green)
                        }.frame(maxWidth: .infinity, maxHeight: 50).background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    }.foregroundColor(Color.black)
                    VStack {
                        ScrollView {
    //                        ForEach(0..<7) { i in
    //                            AnswerView(thumbnail: "person.crop.circle", nickname: i, date: i, contents: i, myname: myname)
    //                        }
                            AnswerView(thumbnail: "person", nickname: "meenu", date: "1시간 전", contents: "노란색을 보면 기분이 좋아짐")
                            AnswerView(thumbnail: "person.fill", nickname: "chemi", date: "2시간 전", contents: "보라색")
                            AnswerView(thumbnail: "person.crop.circle", nickname: "brown", date: "3시간 전", contents: "브라운")
                            AnswerView(thumbnail: "person.crop.circle.fill", nickname: "noel", date: "4시간 전", contents: "보라색")
                            AnswerView(thumbnail: "person.circle", nickname: "rookie", date: "5시간 전", contents: "주황색")
                            AnswerView(thumbnail: "person.circle.fill", nickname: "daon", date: "6시간 전", contents: "연두색")
                        }
                    }.background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : 430)
                }.padding(16)
            }
        }
    }
}

struct AnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDetailView()
    }
}
