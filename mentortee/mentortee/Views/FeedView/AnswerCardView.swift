//
//  AnswerCardView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/10.
//

import SwiftUI

struct CountAnswer: View {
    var body: some View {
        Text("총 n개").frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16.0)
    }
}

struct FeedAnswerCardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
        .padding(15)
    }
}

struct FeedAnswer: View {
    var category: String
    var otherThoughts : String
    var question: String
    var questionOwner: String
    @State var showModal = false
    
    var body: some View {
        GroupBox(){
            HStack{
                HStack{
                    Text(category)
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 5)
                }
            
                Spacer()
            
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(Color.black)
                        .rotationEffect(Angle(degrees: 90))
                }
            
            }.padding(EdgeInsets(top: 15, leading:25 , bottom: 10, trailing: 25))
                
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
                        .frame(width: 100, height: 30)
                        .overlay(Text("내 생각 보기").foregroundColor(Color.white))
                }
                .sheet(isPresented: self.$showModal) {
                    AnswerModalSheet(feedQuestion: question)
                }
            }
            .padding(EdgeInsets(top: 0, leading:25 , bottom: 10, trailing: 25))
            
            Divider()
            
            HStack{
                HStack {
                    Text(questionOwner)
                        .font(.system(size: 16)).bold()
                    Text("의 질문")
                        .font(.system(size: 16)).padding(.leading, -5)
                }
                
                Spacer()
                
                Text(otherThoughts)
                    .font(.system(size: 14))
                
            }.padding(EdgeInsets(top: 15, leading:25 , bottom: 10, trailing: 25))
        
        }.groupBoxStyle(QuestionCardStyle())
    }
}

struct AnswerCardView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                CountAnswer()
                ScrollView {
                    FeedAnswer(category: "가치관",
                                 otherThoughts: "다른 생각 9개",
                                 question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                                 questionOwner: "Chemi")
                }
            }
            .navigationBarTitle("내가 답한 질문", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    })
        }
    }
}

struct AnswerCardView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCardView()
    }
}


//    .navigationBarTitle(Text("질문 만들기"), displayMode: .inline)
//    .navigationBarItems(leading: Button(action: {
//    self.mode.wrappedValue.dismiss()
//}) {
//        Image(systemName: "chevron.backward")
//            .padding(.all, 16)
//            .font(.system(size: 20))
//            .foregroundColor(.black)
//    },
//    trailing: NavigationLink(destination: getDestination()
//            .navigationBarBackButtonHidden(true)
//    )
//    {
//        Text("완료")
//    }
//)
//    .onTapGesture {
//    hideKeyboard()
//}
