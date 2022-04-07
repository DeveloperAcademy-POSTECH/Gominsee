//
//  AnswerView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/06.
//

import SwiftUI

var answer: String = ""
var showingOptions = false

struct CustomAlert: View {
    var body: some View {
        ZStack {
            Rectangle().fill(Color(hex: 0x000000).opacity(0.7)).frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Text("정말 삭제할건가요?").font(.system(size: 20)).bold().padding([.top, .leading, .trailing], 10.0).padding(.bottom, 5)
                Text("삭제하신 답변은 복구할 수 없어요 ㅠ^ㅠ\n신중하게 생각하고 선택해주세요.").padding([.leading, .bottom, .trailing], 10.0).padding(.top, 5)
                    .multilineTextAlignment(.center)
                Divider().frame(width: 300)
                HStack {
                    Button("아니오", role: .cancel) {
                        
                    }.padding(10)
                    Spacer().frame(width: 40)
                    Divider().frame(height: 30)
                    Button("삭제할래요", role: .destructive) {
                        
                    }.padding(10).padding(.leading, 30)
                }
            }.background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        }
    }
}

struct TextFieldAlert: View {
    var body: some View {
        Text("a")
    }
}

struct AnswerView: View {
    @State private var showingOptions = false
    @State private var showingReportAlert = false
    @State private var showingDeleteAlert = false
    @State private var showingAlert = false
    
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
                            .confirmationDialog("행동 선택", isPresented: $showingOptions) {
                                if (myName == nickname) {
                                    Button("수정하기") {
                                        print("수정하기")
                                    }
                                    Button("삭제하기", role: .destructive) {
                                        print("삭제하기")
                                    }
                                }
                                else {
                                    Button("신고하기", role: .destructive) {
                                        print("신고하기")
                                    }
                                }
                            }
                    }.padding(.init(top: 15, leading: 15, bottom: 5, trailing: 15))
                    Text(contents).font(.system(size: 16)).padding([.leading, .bottom, .trailing], 15)
                }.frame(maxWidth: .infinity, alignment: .leading).background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor))
            }.padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
        }
    }
}

struct CustomConfirm: View {
    @State private var showingAlert = false
    
//    var DialType: Bool // true: Question, false: Answer
    var dialAuthor = false // true: Author, false: Other User
    var body: some View {
        ZStack {
            Rectangle().fill(Color(hex: 0x000000).opacity(0.7)).frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                if (dialAuthor) {
                    Button("수정하기") {
                        
                    }.font(.system(size: 30)).foregroundColor(Color.blue).padding(10)
                    Divider()
                    Button("삭제하기") {
                        showingAlert = true
                    }.font(.system(size: 30)).foregroundColor(Color.red).padding(10)
                        .alert("정말 삭제하실 건가요?", isPresented: $showingAlert) {
                            Button("삭제할래요", role: .destructive) {}
                            Button("아니요", role: .cancel) {}
                        } message: {
                            Text("삭제하신 답변은 복구할 수 없어요 ㅠ^ㅠ      신중하게 생각하고 선택해주세요.")
                        }
                }
                else {
                    Button("신고하기") {
                        showingAlert = true
                    }.font(.system(size: 30)).foregroundColor(Color.red).padding(10)
                        .alert("정말 신고하실 건가요?", isPresented: $showingAlert) {
                            Button("신고할래요", role: .destructive) {}
                            Button("아니요", role: .cancel) {}
                                                } message: {
                            TextField("신고 사유를 적어주세요.", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                                }
                }
                Divider()
                Button("취소") {
                    
                }.font(.system(size: 30)).foregroundColor(Color.blue).padding(10)
            }.frame(maxWidth: .infinity).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).padding(.horizontal, 16)
        }
    }
}

struct Accordion: View {
    @State private var collapsed = false
    var body: some View {
        ZStack {
            VStack {
                Spacer().frame(height: 55)
                ScrollView {
                    AnswerView(thumbnail: "person", nickname: "meenu", date: "1시간 전", contents: "노란색을 보면 기분이 좋아짐")
                    AnswerView(thumbnail: "person.fill", nickname: "chemi", date: "2시간 전", contents: "보라색")
                    AnswerView(thumbnail: "person.crop.circle", nickname: "brown", date: "3시간 전", contents: "브라운")
                    AnswerView(thumbnail: "person.crop.circle.fill", nickname: "noel", date: "4시간 전", contents: "보라색")
                    AnswerView(thumbnail: "person.circle", nickname: "rookie", date: "5시간 전", contents: "주황색")
                    AnswerView(thumbnail: "person.circle.fill", nickname: "daon", date: "6시간 전", contents: "연두색")
                    Spacer().frame(height: 5)
                }
            }.frame(maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? .infinity : 0).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            VStack {
                Button(action: { self.collapsed.toggle() }) {
                    HStack {
                        Text("9개의 생각이 있어요.").font(.system(size: 14)).foregroundColor(Color.black)
                        Spacer()
                        Image(systemName: collapsed ? "chevron.up.circle.fill" : "chevron.down.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.mainGreen)
                    }.padding(10)
                }.frame(maxWidth: .infinity, maxHeight: 50).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                Spacer()
            }
        }.padding(.horizontal, 16.0)
    }
}

struct replyAnswer: View {
    @State private var checked = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("질문에 대한 나의 생각을 적어주세요", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).font(.system(size: 16)).padding(.leading, 5.0)
                Button(action: {}) {
                    Image(systemName: "arrow.up.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color.primaryColor)
                }.padding(.trailing, 5.0)
            }.background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor)).padding(.horizontal, 10)
            Button (action: { self.checked.toggle() }) {
                HStack{
                    Image(systemName: checked ? "checkmark.circle.fill" : "checkmark.circle").foregroundColor(checked ? Color.mainGreen : Color.gray)
                    Text("내 생각 나만 볼래요").font(.system(size: 14)).foregroundColor(checked ? Color.black : Color.gray)
                }
            }.padding(.leading, 10)
        }.frame(maxWidth: .infinity, maxHeight: 85).background(Rectangle().fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

struct AnswerDetailView: View {
    var body: some View {
        VStack {
            Accordion()
//            CustomAlert()
//            TextFieldAlert()
            replyAnswer()
        }
    }
}

struct AnswerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerDetailView()
    }
}
