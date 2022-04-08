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
    @State private var MyQuestion : String = ""
    @State private var MyThought : String = ""


    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height
    var categoryList = ["가치관","적성", "진로"]


    var body: some View {

            VStack{
                HStack {
                        Text("질문 만들기")
                            .font(.title)
                            .bold()
                            .padding(.leading, 80)
                            .padding(.top,10)
                    
                    Button(action: {}){
                    
                            Text("완료")
                            .font(.system(size: 21))
                            .bold()
                            .padding(.leading, 40)
                            .padding(.top, 10)
                        }
                           }
                    

//          Try 1 if를 사용한 구문 -> Questionsub1() 초기화없음?
//                    Button(action: {
//                        if isShare == true {
//                            QuestionSub1()
//                        }
//                        else {
//                            QuestionSub2()
//                        }
//
//                    }) {
//                        Text("완료")
//                            .font(.system(size: 21))
//                            .bold()
//                            .padding(.leading, 40)
//                            .padding(.top, 10)
//                    }
//
//            Try 2
//                    NavigationLink(destination: QuestionSub1()) {
//                        Text("완료")
//                            .font(.system(size: 21))
//                            .foregroundColor(.blue)
//                            .bold()
//                            .padding(.leading, 40)
//                            .padding(.top, 10)
//                    }



                ZStack {

                    Rectangle()
                        .foregroundColor(Color.subIvory)

                    VStack(alignment:.leading) {

                            Text("평소 궁금했거나")
                                .font(.title)
                                .bold()
                            Text("좋은 질문이 있으신가요?")
                                .font(.title)
                                .bold()



                        HStack{

                            ForEach(categoryList, id: \.self){ value in
                                Text(value)
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 10)
                                    .foregroundColor(Color.orange)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                                    .font(.system(size: 14))
                            }

                            }



                        TextField("무엇이든지 자유롭게 적어주세요", text: $MyQuestion)

                            .padding(EdgeInsets(top: 15, leading:20 , bottom: 10, trailing: 25))

                            .frame(width: screenWidth1 * 0.9, height: screenHeight1 * 0.2, alignment: .top)

                            .background(RoundedRectangle(
                                cornerRadius: 10).fill(.white))

                        Text("작성해주신 질문에 대한")
                            .font(.title)
                            .bold()
                        Text("OOO님의 생각은 어떠신가요?")
                            .font(.title)
                            .bold()

                    TextField("무엇이든지 자유롭게 적어주세요", text: $MyThought)

                            .padding(EdgeInsets(top: 15, leading:20 , bottom: 10, trailing: 25))

                            .frame(width: screenWidth1 * 0.9, height: screenHeight1 * 0.2, alignment: .top)

                        .background(RoundedRectangle(
                            cornerRadius: 10).fill(.white))

                        HStack{
                            VStack(alignment: .leading) {
                                Text("내 생각 공유하기")
                                    .font(.title)
                                    .bold()


                                Text("내가 작성한 질문이 모두에게 공개되요")
                                    .font(.subheadline)


                            }

                            Toggle("", isOn: $isShare)
                                .frame(width: screenWidth1 * 0.3, height: screenHeight1 * 0.1)
                                .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
                        }
                    }

                }

            }



    }
}

struct QuestionMakingMain_Previews: PreviewProvider {
    static var previews: some View {
        QuestionMakingMain()
    }
}
