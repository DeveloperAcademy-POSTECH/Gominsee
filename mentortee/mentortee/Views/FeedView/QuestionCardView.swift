//
//  QuestionCardView.swift
//  mentortee
//
//  Created by Jihye Hong on 2022/04/07.
//

import Foundation
import SwiftUI

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
    @State var showDetails = false
    
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
                    self.showDetails.toggle()
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.primaryColor)
                        .frame(width: 80, height: 30)
                        .overlay(Text("생각 적기").foregroundColor(Color.white))
                }
                    if showDetails {
                        Text("You should see me in a crown")
                            .font(.largeTitle)
                            .lineLimit(nil)
                        }
            }
            .padding(EdgeInsets(top: 0, leading:25 , bottom: 10, trailing: 25))
        Divider()
        
        HStack{
            Text(questionOwner + "의 질문")
                .font(.system(size: 16))
            
            Spacer()
            
            Text(otherThoughts)
                .font(.system(size: 14))
            
        }.padding(EdgeInsets(top: 15, leading:25 , bottom: 10, trailing: 25))
    
    }.groupBoxStyle(QuestionCardStyle())
    }
}

struct FeedQuestionView: View {
    var body: some View {
        
            VStack {
                FeedQuestion(category: "가치관",
                             otherThoughts: "다른 생각 9개",
                             question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                             questionOwner: "Chemi")
            }
        }
}

struct FeedQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        FeedQuestionView()
    }
}

