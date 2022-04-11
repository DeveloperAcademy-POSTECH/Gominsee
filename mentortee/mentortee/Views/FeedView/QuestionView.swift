//
//  QuestionView.swift
//  mentortee
//
//  Created by Yu ahyeon on 2022/04/06.
//

import SwiftUI

struct QuestionCardStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
        .background(RoundedRectangle(cornerRadius: 10.0)
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        )
        .padding(15)
        .frame(alignment: .top)
    }
}


struct Question: View {
    var thumbnail: String
    var nickName: String
    var uploadTime : String
    var category: String
    var question: String
    
    var body: some View {
        GroupBox() {
        HStack() {
            HStack{
                Image(systemName: thumbnail)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(nickName)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                } //프로필
            Spacer()
            Text(uploadTime)
                .frame(alignment: .trailing)
                .font(.system(size: 14))
            //업로드 시간
        }
        .padding(EdgeInsets(top: 15, leading:25 , bottom: 10, trailing: 25))
            Divider() //구분선
                .padding(.horizontal, 15)
            VStack(alignment: .leading) {
                Text(category)
                    .font(.system(size: 14))
                    .padding(.bottom, 5)
                Text(question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)
            } //카테고리와 질문
            .padding(EdgeInsets(top: 15, leading:25 , bottom: 30, trailing: 25))
        }.groupBoxStyle(QuestionCardStyle())
    }
}

struct QuestionView: View {
    var body: some View {
        VStack {
                Question(thumbnail: "person.crop.circle",nickName:"노엘",uploadTime:"1시간 전", category:"카테고리", question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?")
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
