//
//  MyPageCategory.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/13.
//

import SwiftUI

struct MypageCategory: View {
    @State var click2 = [false, false, false, false, false, false, false, false, false]
    let screenHeight = UIScreen.main.bounds.height

    // 카테고리 - 전체,가치관, 진로, 취향, 취미, 고민, 비밀, 회고, 습관
    var body: some View {
        HStack {
            ScrollView(.horizontal,
                showsIndicators: false) {
                HStack (spacing: 5) {
                    Button("전체") {
                        withAnimation(.easeInOut) {
                            click2[0] = true

                        }
                    }
                        .frame(width: 60, height: 30)
                        .background(RoundedRectangle(cornerRadius: 40)
                            .fill(click2[0] ? Color.primaryColor : Color.gray))
                        .foregroundColor(Color.white)

                    Button(action: {
                        withAnimation(.easeInOut) {
                            click2[1] = true

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
                            click2[2] = true

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
                            click2[3] = true

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
                            click2[4] = true
                  
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
                            click2[5] = true
                          
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
                            click2[6] = true
                       
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
                            click2[7] = true
                      
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
                            click2[8] = true
                         
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
        }
            .padding(.all, 16)
    }
}

struct MypageCategory_Previews: PreviewProvider {
    static var previews: some View {
        MypageCategory()
    }
}
