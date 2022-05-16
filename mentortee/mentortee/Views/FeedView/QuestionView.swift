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
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}


struct QuestionAnswerCard: View {
    var thumbnail: String
    var nickName: String
    var uploadTime: String
    var category: String
    var question: String

    var body: some View {
        GroupBox() {
            HStack() {
                HStack {
                    Image(thumbnail)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(nickName)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
                Spacer()
                Text(uploadTime)
                    .frame(alignment: .trailing)
                    .font(.system(size: 14))
            }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 10, trailing: 25))
            Divider()
                .padding(.horizontal, 15)
            VStack(alignment: .leading) {
                Text(category)
                    .font(.system(size: 14))
                    .padding(.bottom, 5)
                Text(question)
                    .font(.system(size: 22))
                    .fontWeight(.heavy)
                    .lineSpacing(5)
            }
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 30, trailing: 25))
        }.groupBoxStyle(QuestionCardStyle())
    }
}

struct QuestionView: View {
    var body: some View {
        VStack {
            QuestionAnswerCard(thumbnail: "thumbnail_lv1", nickName: "noel", uploadTime: "7시간 전", category: "취향", question: "무슨 색을 좋아하나요?")
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
