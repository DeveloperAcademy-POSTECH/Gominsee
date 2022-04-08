//
//  TopBarQuestion.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/07.
//


// 텍스트필드에 입력한 값을 변수에 저장할 수 있게
// 생각 공유 on/off
//


import SwiftUI

struct TopBarQuestion: View {
    
    var body: some View {
        
        HStack {
                Text("질문 만들기")
                    .font(.title)
                    .bold()
                    .padding(.leading, 80)
                    .padding(.top,10)

                NavigationLink(destination:
                 QuestionSub1())
            {
                    
                    Text("완료")
                        .font(.system(size: 21))
                        .bold()
                        .padding(.leading, 40)
                        .padding(.top, 10)
                }
        }

                
            }
        }
    



struct SecondView: View {
    var body: some View {
        Text("Here is Secondary View")
    }
}


struct TopBarQuestion_Previwer: PreviewProvider {
    static var previews: some View {
        TopBarQuestion()
    }
}
