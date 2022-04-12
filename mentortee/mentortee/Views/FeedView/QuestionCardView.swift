//
//  QuestionCardView.swift
//  mentortee
//
//  Created by Jihye Hong on 2022/04/07.
//

import Foundation
import SwiftUI

//struct QnaTopBar: View {
//    var body: some View {
//        NavigationView {
//            VStack {
////                .navigationBarItems(leading: Text("고민씨")
////                    .padding(.all, 16)
////                    .font(.system(size: 22)
////                        .weight(.bold))
////                        .foregroundColor(.primaryColor),
////                                    trailing: NavigationLink(destination: QuestionMakingMain()
////                                        .navigationBarBackButtonHidden(true))
////                                    {
////                    Image(systemName: "square.and.pencil")
////                        .padding(.all, 16)
////                        .font(.system(size: 20))
////                        .foregroundColor(.mainGreen)
////                })
//            }
//        }
//    }
//}

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
    var otherThoughts : String
    var question: String
    var questionOwner: String
    @State var showModal = false
    @State var showQuestionDetailview = false
    
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
            
            
            VStack(alignment: .leading){
                
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
                NavigationLink(destination: QuestionDetailView(nickname: "노엘")
                    .navigationBarHidden(true)) {
                            VStack{
                                Text(otherThoughts)
                        }
                }
                
                
            }.padding(EdgeInsets(top: 15, leading:25 , bottom: 10, trailing: 25))
            
        }.groupBoxStyle(QuestionCardStyle())
    }
}

struct QuestionCardView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        
        NavigationView {
            VStack {
                CountQuestion()
                ScrollView {
                    FeedQuestion(category: "가치관",
                                 otherThoughts: "다른 생각 9개",
                                 question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                                 questionOwner: "Chemi")
                }
            }
            .navigationBarTitle("내가 한 질문", displayMode: .inline)
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

struct QuestionCardView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionCardView()
    }
}

