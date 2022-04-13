//
//  QuestionMakingMain.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/08.
//


import SwiftUI

struct QuestionMakingMain: View {
    @State private var isShare = false
    @State private var myQuestion: String = "무엇이든지 자유롭게 적어주세요!"
    @State private var myThought: String = "무엇이든지 자유롭게 적어주세요!"
    @State private var myQuestionColor = Color.black.opacity(0.2)
    @State private var myThoughtColor = Color.black.opacity(0.2)
    @Binding var firstNaviLinkActive: Bool
    

    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height

    var categoryList = ["가치관", "적성", "진로", "취향", "취미", "고민", "비밀", "회고", "습관"]
    @State var click2 = [false, false, false, false, false, false, false, false, false]
    @State var checkList: [String] = []
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {

        ZStack {
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

                                ScrollView(.horizontal,
                                showsIndicators: false) {
                                    HStack (spacing: 5) {

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[1].toggle()

                                            }
                                        }, label: {
                                                Text("가치관")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[1] ? Color.primaryColor : Color.gray))

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[2].toggle()

                                            }
                                        }, label: {
                                                Text("진로")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[2] ? Color.primaryColor : Color.gray))

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[3].toggle()

                                            }
                                        }, label: {
                                                Text("취향")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[3] ? Color.primaryColor : Color.gray))

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[4].toggle()
                                      
                                            }
                                        }, label: {
                                                Text("취미")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[4] ? Color.primaryColor : Color.gray))

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[5].toggle()
                                              
                                            }
                                        }, label: {
                                                Text("고민")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[5] ? Color.primaryColor : Color.gray))

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[6].toggle()
                                           
                                            }
                                        }, label: {
                                                Text("비밀")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[6] ? Color.primaryColor : Color.gray))

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[7].toggle()
                                          
                                            }
                                        }, label: {
                                                Text("회고")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[7] ? Color.primaryColor : Color.gray))

                                        Button(action: {
                                            withAnimation(.easeInOut) {
                                                click2[8].toggle()
                                             
                                            }
                                        }, label: {
                                                Text("습관")
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 15))
                                                    .frame(width: 60, height: 35, alignment: .center)
                                            })
                                            .padding()
                                            .frame(width: 60, height: 30, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(RoundedRectangle(cornerRadius: 40)
                                                .fill(click2[8] ? Color.primaryColor : Color.gray))
                                    }
                                }
                                .padding(.bottom, 10)
                                
                                TextEditor(text: $myQuestion)
                                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 10, trailing: 25))
                                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 0.2)
                                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
                                    .foregroundColor(myQuestionColor)
                                
                                    .onTapGesture {
                                        if myQuestion == "무엇이든지 자유롭게 적어주세요!" {
                                    myQuestion = ""
                                    myQuestionColor = Color.black
                                        } else {
                                            hideKeyboard()
                                        }
                                }
                                

                                Text("작성해주신 질문에 대한")
                                    .font(.system(size: 24))
                                    .bold()

                                Text("OOO님의 생각은 어떠신가요?")
                                    .font(.system(size: 24))
                                    .bold()

                                TextEditor(text: $myThought)
                                    .padding(EdgeInsets(top: 5, leading: 8, bottom: 10, trailing: 25))
                                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height * 0.2)
                                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0))
                                
                                    .foregroundColor(myThoughtColor)
                                    .onTapGesture {
                                        if myThought == "무엇이든지 자유롭게 적어주세요!" {
                                    myThought = ""
                                    myThoughtColor = Color.black
                                        } else {
                                            hideKeyboard()
                                        }
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
                      
                        .padding()
                        .onTapGesture {
                            hideKeyboard()
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

struct QuestionMakingMain_Previews: PreviewProvider {
    @State var firstNaviLinkActive: Bool

    static var previews: some View {
        QuestionMakingMain(firstNaviLinkActive: .constant(true))
    }
}
