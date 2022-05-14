//
//  FeedView.swift
//  mentortee
//
//  Created by 이지수 on 2022/04/08.
//

import SwiftUI

struct FeedView: View {
    @State private var showModal = false

    var body: some View {
        
        
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.backgroundColor)
                        .ignoresSafeArea()
                    
                    VStack {
                        FeedCategoryBtn()
                            .padding()
                        
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "가치관",
                                    otherThoughts: "다른 생각 9개",
                                    question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                                    questionOwner: "Chemi",
                                    nickname: "Chemi"
                                )
                                FeedQuestion(category: "취미",
                                    otherThoughts: "다른 생각 10개",
                                    question: "요즘 가장 즐기고 있는 일은 무엇인가요?",
                                    questionOwner: "Brown",
                                    nickname: "Chemi"
                                )
                                FeedQuestion(category: "습관",
                                    otherThoughts: "다른 생각 120개",
                                    question: "오늘 아침에 일어나자마자 한 행동은 무엇인가요?",
                                    questionOwner: "Daon",
                                    nickname: "Chemi"
                                )
                            }
                        }.frame(height: geo.size.height * 0.88)
                    }
                }
            }

        }
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
