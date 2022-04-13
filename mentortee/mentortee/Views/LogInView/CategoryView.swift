//
//  CategoryView.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/12.
//

import SwiftUI

struct CategoryView: View {
    @State var click1 = [false, false, false, false, false, false, false, false, false]
    @State var isLogIn = true
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        VStack {
            Text("어떤 것에 관심이 있나요?")
                .font(.system(size: 26))
                .bold()
                .padding(.leading, 16)
                .foregroundColor(.mainGreen)
            Text("")
                .padding(.top, 10)
            HStack {
                Group {
                    VStack {
                        Image("category_1")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[0].toggle()
                            }
                        }, label: {
                                Text("취미")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[0] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[0] ? Color.white : Color.black)
                    }
                }
                    .padding()

                Group {
                    VStack {
                        Image("category_2")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())

                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[1].toggle()

                            }
                        }, label: {
                                Text("진로")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[1] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[1] ? Color.white : Color.black)
                    }
                }
                    .padding()

                Group {
                    VStack {
                        Image("category_3")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[2].toggle()
                            }
                        }, label: {
                                Text("가치관")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[2] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[2] ? Color.white : Color.black)
                    }
                }
                    .padding()

            }
            HStack {
                Group {
                    VStack {
                        Image("category_4")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[3].toggle()
                            }
                        }, label: {
                                Text("습관")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[3] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[3] ? Color.white : Color.black)
                    }
                }
                    .padding()

                Group {
                    VStack {
                        Image("category_5")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[4].toggle()
                            }
                        }, label: {
                                Text("자존감")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[4] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[4] ? Color.white : Color.black)
                    }
                }
                    .padding()

                Group {
                    VStack {
                        Image("category_6")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[5].toggle()
                            }
                        }, label: {
                                Text("관심사")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[5] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[5] ? Color.white : Color.black)
                    }
                }
                    .padding()

            }

            HStack {
                Group {
                    VStack {
                        Image("category_7")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())

                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[6].toggle()

                            }
                        }, label: {
                                Text("취향")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[6] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[6] ? Color.white : Color.black)
                    }
                }
                    .padding()

                Group {
                    VStack {
                        Image("category_8")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[7].toggle()

                            }
                        }, label: {
                                Text("모임")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[7] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[7] ? Color.white : Color.black)
                    }
                }
                    .padding()

                Group {
                    VStack {
                        Image("category_9")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        Button(action: {
                            withAnimation(.easeInOut) {
                                click1[8].toggle()
                            }
                        }, label: {
                                Text("관계")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                            })
                            .padding()
                            .frame(width: 71, height: 30, alignment: .center)
                            .foregroundColor(Color.white)
                            .background(RoundedRectangle(cornerRadius: 40)
                                .fill(click1[8] ? Color.primaryColor : Color.gray))
                            .foregroundColor(click1[8] ? Color.white : Color.black)
                    }
                }
                    .padding()
            }

            Text("")
                .padding()

            if isLogIn == false {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.primaryColor)
                        .frame(width: .infinity, height: 50)
                        .overlay(Text("다 골랐어요!")
                            .foregroundColor(Color.white)
                            .bold())
                }
                    .padding(.horizontal, 16)
            } else {
                NavigationLink(destination: ContentView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)) {
                    Button(action: {
                        self.mode.wrappedValue.dismiss()
                    }) {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(Color.primaryColor)
                            .frame(width: .infinity, height: 50)
                            .overlay(Text("다 골랐어요!")
                                .foregroundColor(Color.white)
                                .bold())
                    }
                        .padding(.horizontal, 16)
                }
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
