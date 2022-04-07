//
//  QuestionSub1.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/07.
//

import SwiftUI

struct QuestionSub1: View {
    var body: some View {
        VStack {
            Image("WomanUser")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("작성 완료!")
                .font(.title2)
                .padding()
            
            Text("스스로에게 한발짝 더 다가갔군요?")
                .font(.subheadline)
            Text("게시판에 내가 쓴 질문이 올라갔어요!")
                .font(.subheadline)
            
            Text("게시판으로 가볼래요?")
                .bold()
                .font(.title3)
                .foregroundColor(.white)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .background(Color.primaryColor)
                .cornerRadius(15)
            
        }
    }
}

struct QuestionSub1_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSub1()
    }
}
