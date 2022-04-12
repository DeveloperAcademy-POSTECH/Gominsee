//
//  MyPageView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/10.
//

import SwiftUI

struct MyInfo: View {
    var username: String
    var body: some View {
        HStack {
            HStack {
                Text(username).bold()
                Text("님").padding(.leading, -5)
            }.font(.system(size: 24))
            Spacer()
            Button("로그아웃") {
                
            }
        }
    }
}

struct MyQna: View {
    let screenWidth = UIScreen.main.bounds.width
    var cntMyQuestion: Int
    var cntMyAnswer: Int
    
    var body: some View {
        HStack {
            NavigationLink(destination: QuestionCardView()
                .navigationBarHidden(true)) {
                VStack {
                    Text("내가 만든 질문").font(.system(size: 14)).bold()
                    Text("\(cntMyQuestion)").font(.system(size: 30)).bold()
                }.frame(width: (screenWidth - 50) / 2)
            }
            .foregroundColor(.black)
            
            Divider()
            
            NavigationLink(destination: QuestionCardView()
                .navigationBarHidden(true)) {
                VStack {
                    Text("내가 답한 질문").font(.system(size: 14)).bold()
                    Text("\(cntMyAnswer)").font(.system(size: 30)).bold()
                }.frame(width: (screenWidth - 50) / 2)
            }
            .foregroundColor(.black)
            
        }.frame(maxWidth: .infinity, maxHeight: 90).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}

struct MyCharacter: View {
    var userLV = 1
    var cntRequireQuestion = 1
    var cntRequireAnswer = 2
    
    var body: some View {
        ZStack {
            VStack {
                Image("character_lv1").shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                Spacer()
            }
            VStack {
                HStack {
                    HStack {
                        Text("곰민").font(.system(size: 20)).bold()
                        Text("Lv. \(userLV)").font(.system(size: 14))
                    }.frame(alignment: .leading).padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                    Spacer()
                }
                Spacer().frame(height: 5)
                HStack {
                    HStack {
                        Text("다음 성장까지")
                        Text("질문 \(cntRequireQuestion)개, 답변 \(cntRequireAnswer)개").bold()
                        Text("가 필요해요!")
                    }.font(.system(size: 14)).padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                    Spacer()
                }
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(25)
        }
    }
}

struct favoriteCategory: View {
    


    var body: some View {
        NavigationLink(destination: CategoryView()
            .navigationBarHidden(true)) {
                HStack {
                    Text("관심 카테고리").font(.system(size: 16)).padding(.leading, 10)
                    Spacer()
                    Image(systemName: "chevron.right").padding(.trailing, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        // this sets the screen title in the navigation bar, when the screen is visible
//                        Text("")
//                    }
//                }
        }
    }
}

struct MyPageView: View {
    var body: some View {
            VStack {
                MyInfo(username: "meenu")
                MyQna(cntMyQuestion: 10, cntMyAnswer: 10)
                MyCharacter()
                favoriteCategory()
                Spacer()
            }
            .offset(y: -40)
            .padding(.horizontal, 16)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
