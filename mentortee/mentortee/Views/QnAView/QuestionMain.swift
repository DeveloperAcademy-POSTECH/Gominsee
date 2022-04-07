//
//  QuestionMain.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/07.
//

import SwiftUI

struct QuestionMain: View {
    
    @State private var IsToggle = false
    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(Color.subIvory)
            
            VStack(alignment:.leading) {
                
                    Text("평소 궁금했거나")
                        .font(.title)
                    Text("좋은 질문이 있으신가요?")
                        .font(.title)
                
        
                HStack{
                    Text("전체")
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color.primaryColor)
                        .cornerRadius(15)
                    
                    Text("가치관")
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color.primaryColor)
                        .cornerRadius(15)
                    
                    Text("습관")
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color.primaryColor)
                        .cornerRadius(15)
                    
                    Text("자존감")
                        .foregroundColor(.white)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(Color.primaryColor)
                        .cornerRadius(15)
                    }
                
                TextField("무엇이든지 자유롭게 적어주세요", text: .constant(""))
                    .frame(width: screenWidth1 * 0.9, height: screenHeight1 * 0.2, alignment: .top)
                    .background(RoundedRectangle(
                        cornerRadius: 10).fill(.white))
                
                Text("작성해주신 질문에 대한")
                    .font(.title)
                Text("OOO님의 생각은 어떠신가요?")
                    .font(.title)
            
            TextField("무엇이든지 자유롭게 적어주세요", text: .constant(""))
                    .frame(width: screenWidth1 * 0.9, height: screenHeight1 * 0.2, alignment: .top)
                .background(RoundedRectangle(
                    cornerRadius: 10).fill(.white))
                
                HStack{
                    VStack(alignment: .leading) {
                        Text("내 생각 공유하기")
                            .font(.title)

                        
                        Text("내가 작성한 질문이 모두에게 공개되요")
                            .font(.subheadline)

                    }
                    Toggle("", isOn: $IsToggle)
                        .frame(width: screenWidth1 * 0.3, height: screenHeight1 * 0.1)
                }
            }
            
        }

        
    }
}

struct QuestionMain_Previews: PreviewProvider {
    static var previews: some View {
        QuestionMain()
    }
}


// 미뉴 -> 패딩값 적용할 수 있는 코드 주세요
// 브라운 -> 카테고리 선택 시 색깔 바뀌는 코드 좀 부탁드립니다.
// 
