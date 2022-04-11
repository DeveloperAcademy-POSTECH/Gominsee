//
//  QuestionMakingMain.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/08.
//

// 버튼 버전의 화면 전환 

import SwiftUI

struct QuestionMakingMain: View {
    @State private var isShare = false
    @State private var myQuestion : String = "무엇이든지 자유롭게 적어주세요"
    @State private var myThought : String = "무엇이든지 자유롭게 적어주세요"
    @State private var myQuestionColor = Color.black.opacity(0.2)
    @State private var myThoughtColor = Color.black.opacity(0.2)

    // 기기별 스크린너비 변수받아오기
    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height
    
    // 카테고리 리스트화 하기
    
    var categoryList = ["가치관","적성", "진로"]

    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                    
                    VStack{
                        
    //                    ZStack {
                        
                            // 배경화면 색상 설정
                            
                            VStack(alignment:.leading) {
                                    Text("평소 궁금했거나")
                                        .font(.system(size: 24))
                                        .bold()
                                        .padding(.top, 30)
                                    Text("좋은 질문이 있으신가요?")
                                        .font(.system(size: 24))
                                        .bold()
                                
                                HStack{

                                    ForEach(categoryList, id: \.self){ value in
                                        Text(value)
                                            .padding(.vertical, 3)
                                            .padding(.horizontal, 10)
                                            .foregroundColor(Color.orange)
                                            .background(RoundedRectangle(cornerRadius: 10).fill(.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                                            .font(.system(size: 14))
                                    }
                                }
                                
                                TextEditor(text: $myQuestion)
                                // 입력한 텍스트값 변수로 받기 $ 기호는 왜 필요한지?? -> 받는 변수가 바껴서
                                
                                    .padding(EdgeInsets(top: 5, leading: 8 , bottom: 10, trailing: 25))
                                    .frame(width: screenWidth1 * 0.9, height: screenHeight1 * 0.2, alignment: .top).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                                
                                    .background(RoundedRectangle(
                                        cornerRadius: 10).fill(.white))
                                
                                    .foregroundColor(myQuestionColor)
                                    .onTapGesture {
                                        myQuestion = ""
                                        myQuestionColor = Color.black
                                    }
                                
                                Text("작성해주신 질문에 대한")
                                    .font(.system(size: 24))
                                    .bold()
                                
                                Text("OOO님의 생각은 어떠신가요?")
                                    .font(.system(size: 24))
                                    .bold()
                            
                                
                            TextEditor(text: $myThought)
                                    .padding(EdgeInsets(top: -5, leading: 8 , bottom: 10, trailing: 25))
                                    .frame(width: screenWidth1 * 0.9, height: screenHeight1 * 0.2, alignment: .top).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                                
                                .background(RoundedRectangle(
                                    cornerRadius: 10).fill(.white))
                                .foregroundColor(myThoughtColor)
                                .onTapGesture {
                                    myThought = ""
                                    myThoughtColor = Color.black
                                }
                                
                                HStack{
                                    VStack(alignment: .leading) {
                                        Text("내 생각 공유하기")
                                            .font(.system(size: 24))
                                            .bold()
                                        Text("내가 작성한 질문이 모두에게 공개되요")
                                            .font(.subheadline)
                                            .padding(.top, -5)
                                    }
                                    Toggle("", isOn: $isShare)
                                    
                                    // 스위치 on /off 여부 불리안으로 변수 저장
                                    
                                        .frame(width: screenWidth1 * 0.3, height: screenHeight1 * 0.1)
                                        .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
                                }
                            }
    //                    }


                    }
                    
                    .navigationBarItems(leading: NavigationLink (destination: MainView()
                        .navigationBarHidden(true)) {
                        Image(systemName: "chevron.backward")
                            .padding(.all, 16)
                            .font(.system(size: 20))
                            .foregroundColor(Color.black)
                    }
                        , trailing: NavigationLink (destination: getDestination()
                            .navigationBarBackButtonHidden(true)) {
                        Text("완료")
                    }
                        )
                    
                    
                    .navigationBarTitle(Text("질문 만들기"), displayMode: .inline)
                    
                    
                    .onTapGesture {
                        hideKeyboard()
                        

                }
                
                
            }
        }
    }
    // destination 함수 선언 conditional struct 로 AnyView 사용?
    
    func getDestination() -> AnyView {
        if (isShare == true) {
            return AnyView(QuestionSub2())
        }
        else {
            return AnyView(QuestionSub1())
        }
    }
    
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}


//HStack {
//    Text("질문 만들기")
//        .font(.title)
//        .bold()
//        .padding(.leading, 80)
//        .padding(.top,10)
//
//    NavigationLink(destination: getDestination()
//        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(true)) {
//
//            //destination 부분의 숨겨진 상단바 + 뒤로가기 없애기
//
//            Text("완료")
//            .font(.system(size: 21))
//            .foregroundColor(.blue)
//            .bold()
//            .padding(.leading, 40)
//            .padding(.top, 10)
//    }
//}


struct QuestionMakingMain_Previews: PreviewProvider {
    static var previews: some View {
        QuestionMakingMain()
    }
}
