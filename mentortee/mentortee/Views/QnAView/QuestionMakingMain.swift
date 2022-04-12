//
//  QuestionMakingMain.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/08.
//


import SwiftUI

struct QuestionMakingMain: View {
    @State private var isShare = false
    @State private var myQuestion: String = "무엇이든지 자유롭게 적어주세요"
    @State private var myThought: String = "무엇이든지 자유롭게 적어주세요"
    @State private var myQuestionColor = Color.black.opacity(0.2)
    @State private var myThoughtColor = Color.black.opacity(0.2)
    @Binding var firstNaviLinkActive: Bool

    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height

    var categoryList = ["가치관", "적성", "진로"]

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("평소 궁금했거나")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.top, 30)
                        Text("좋은 질문이 있으신가요?")
                            .font(.system(size: 24))
                            .bold()

                        HStack {
                            ForEach(categoryList, id: \.self) { value in
                                Text(value)
                                    .padding(.vertical, 3)
                                    .padding(.horizontal, 10)
                                    .foregroundColor(Color.orange)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                                    .font(.system(size: 14))
                            }
                        }

                        TextEditor(text: $myQuestion)
                            .padding(EdgeInsets(top: 5, leading: 8, bottom: 10, trailing: 25))
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
                            .padding(EdgeInsets(top: -5, leading: 8, bottom: 10, trailing: 25))
                            .frame(width: screenWidth1 * 0.9, height: screenHeight1 * 0.2, alignment: .top).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)

                            .background(RoundedRectangle(
                            cornerRadius: 10).fill(.white))
                            .foregroundColor(myThoughtColor)
                            .onTapGesture {
                            myThought = ""
                            myThoughtColor = Color.black
                        }

                        HStack {
                            VStack(alignment: .leading) {
                                Text("내 생각 공유하기")
                                    .font(.system(size: 24))
                                    .bold()
                                Text("내가 작성한 질문이 모두에게 공개되요")
                                    .font(.subheadline)
                                    .padding(.top, -5)
                            }
                            Toggle("", isOn: $isShare)
                                .frame(width: screenWidth1 * 0.3, height: screenHeight1 * 0.1)
                                .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
                        }
                    }
                }

                    .navigationBarTitle(Text("질문 만들기"), displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    },
                    trailing: NavigationLink(destination: getDestination()
                            .navigationBarBackButtonHidden(true)
                                             
                    )
                    {
                        Text("완료")
                    }
                )
                    .onTapGesture {
                    hideKeyboard()
                }
            }
        }
    }

    func getDestination() -> AnyView {
        if (isShare == true) {
            return AnyView(QuestionSub1(firstNaviLinkActive: $firstNaviLinkActive)
                .navigationBarHidden(true))
        }
        else {
            return AnyView(QuestionSub2(firstNaviLinkActive: $firstNaviLinkActive)
                .navigationBarHidden(true))
        }
    }

    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

//struct QuestionMakingMain_Previews: PreviewProvider {
//    @State var firstNaviLinkActive: Bool
//    
//    static var previews: some View {
//        QuestionMakingMain()
//    }
//}
