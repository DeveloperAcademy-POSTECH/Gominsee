//
//  FeedCategoryBtn.swift
//  mentortee
//
//  Created by 이지수 on 2022/04/06.
//

import SwiftUI

struct FeedCategoryBtn: View {
    @State var click = [true, false, false, false, false, false, false, false, false]
    
    let screenHeight = UIScreen.main.bounds.height
    
    // 카테고리 - 전체,가치관, 진로, 취향, 취미, 고민, 비밀, 회고, 습관
    var body: some View {
        HStack {
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack (spacing: 5) {
                    //전체 0
                    Button("전체") {
                        withAnimation(.easeInOut) {
                            click[0] = true
                            for i in 0..<click.count{
                                if i != 0 {
                                    click[i] = false
                                }
                            }
                        // 여기에 필터 조건 추가 (카톡에 링크)
                        }
                    }
                    .frame(width: 60, height: 30)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[0] ? Color.primaryColor : Color.gray))
                    .foregroundColor(click[0] ? Color.white : Color.black)
                
                    // 가치관 1
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[1] = true
                            for i in 0..<click.count{
                                if i != 1 {
                                    click[i] = false
                                }
                            }
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
                        .fill(click[1] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[1] ? Color.white : Color.black)
                    
                    // 진로 2
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[2] = true
                            for i in 0..<click.count{
                                if i != 2 {
                                    click[i] = false
                                }
                            }
                        }
                    }, label: {
                        Text("진로")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    })
                    .padding()
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[2] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[2] ? Color.white : Color.black)
                    
                    // 취향 3
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[3] = true
                            for i in 0..<click.count{
                                if i != 3 {
                                    click[i] = false
                                }
                            }
                        }
                    }, label: {
                        Text("취향")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    })
                    .padding()
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[3] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[3] ? Color.white : Color.black)
                    
                    //취미 4
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[4] = true
                            for i in 0..<click.count{
                                if i != 4 {
                                    click[i] = false
                                }
                            }
                        }
                    }, label: {
                        Text("취미")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    })
                    .padding()
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[4] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[4] ? Color.white : Color.black)
                    
                    // 고민 5
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[5] = true
                            for i in 0..<click.count{
                                if i != 5 {
                                    click[i] = false
                                }
                            }
                        }
                    }, label: {
                        Text("고민")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    })
                    .padding()
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[5] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[5] ? Color.white : Color.black)
                    
                    // 비밀 6
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[6] = true
                            for i in 0..<click.count{
                                if i != 6 {
                                    click[i] = false
                                }
                            }
                        }
                    }, label: {
                        Text("비밀")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    })
                    .padding()
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[6] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[6] ? Color.white : Color.black)
                    
                    // 회고 7
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[7] = true
                            for i in 0..<click.count{
                                if i != 7 {
                                    click[i] = false
                                }
                            }
                        }
                    }, label: {
                        Text("회고")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    })
                    .padding()
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[7] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[7] ? Color.white : Color.black)
                    
                    // 습관 8
                    Button(action: {
                        withAnimation(.easeInOut) {
                            click[8] = true
                            for i in 0..<click.count{
                                if i != 8 {
                                    click[i] = false
                                }
                            }
                        }
                    }, label: {
                        Text("습관")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                    })
                    .padding()
                    .frame(width: 60, height: 30, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(RoundedRectangle(cornerRadius: 40)
                        .fill(click[8] ? Color.primaryColor  : Color.gray))
                    .foregroundColor(click[8] ? Color.white : Color.black)
                    
                }//.frame(width: .infinity, height: screenHeight - 200 , alignment: .topLeading)
                .padding(16)
                .background(Color.backgroundColor)
                
            }
        }
    }
}

struct FeedCategoryBtn_Previews: PreviewProvider {
    static var previews: some View {
        FeedCategoryBtn()
    }
}


