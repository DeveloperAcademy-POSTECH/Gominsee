//
//  FeedView.swift
//  mentortee
//
//  Created by 이지수 on 2022/04/08.
//

// 1. 카테고리 별로 바뀌는거
// 2. 생각적기에서 question 불러오는거 (ok)
// 3. question card 클릭하면 question detail view 로 넘어가는거
// 3. 탑바 - 카테고리 사이 여백 줄이기
// 4. 사람들이 질문하는거 받아오는거? (루키 새질문 뷰)


import SwiftUI

struct FeedView: View {
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                VStack{
                    FeedCategoryBtn()
                    ScrollView{
                        VStack {
                            FeedQuestion(category: "가치관",
                                         otherThoughts: "다른 생각 9개",
                                         question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                                         questionOwner: "Chemi")
                            FeedQuestion(category: "취미",
                                         otherThoughts: "다른 생각 10개",
                                         question: "요즘 가장 즐기고 있는 일은 무엇인가요?",
                                         questionOwner: "Brown")
                            FeedQuestion(category: "습관",
                                         otherThoughts: "다른 생각 120개",
                                         question: "오늘 아침에 일어나자마자 한 행동은 무엇인가요?",
                                         questionOwner: "Daon")
                        }
                    }
                }
            }
            .navigationBarItems(leading: Text("고민씨")
                .padding(.all, 16)
                .font(.system(size: 22)
                    .weight(.bold))
                    .foregroundColor(.primaryColor)
                                , trailing: NavigationLink(destination: QuestionMakingMain()
                                    .navigationBarBackButtonHidden(true)
                                ) {
                Image(systemName: "square.and.pencil")
                    .padding(.all, 16)
                    .font(.system(size: 20))
                    .foregroundColor(.mainGreen)
            })
        }
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
