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
            VStack {
                Text("내가 만든 질문").font(.system(size: 14)).bold()
                Text("\(cntMyQuestion)").font(.system(size: 30)).bold()
            }.frame(width: (screenWidth - 50) / 2)
            Divider()
            VStack {
                Text("내가 답한 질문").font(.system(size: 14)).bold()
                Text("\(cntMyAnswer)").font(.system(size: 30)).bold()
            }.frame(width: (screenWidth - 50) / 2)
        }.frame(maxWidth: .infinity, maxHeight: 90).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}

struct MyCharacter: View {
    var body: some View {
        Text("a").frame(maxWidth: .infinity, maxHeight: .infinity).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
    }
}

struct favoriteCategory: View {
    var body: some View {
        Button (action: {}) {
            HStack {
                Text("aaaaaa").font(.system(size: 16)).padding(.leading, 10)
                Spacer()
                Image(systemName: "chevron.right").padding(.trailing, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
        }.foregroundColor(Color.black)
    }
}

struct MyPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                MyInfo(username: "meenu")
                MyQna(cntMyQuestion: 10, cntMyAnswer: 10)
                MyCharacter()
                favoriteCategory()
            }.offset(y:-40).padding(.horizontal, 16)
            .navigationBarItems(leading: Text("고민씨")
                .padding(.all, 16)
                .font(.system(size: 22).weight(.bold))
                .foregroundColor(.primaryColor),
                                trailing: NavigationLink(destination: QuestionMakingMain()
                                    .navigationBarBackButtonHidden(true))
                                {
                Image(systemName: "gearshape")
                    .padding(.all, 16)
                    .foregroundColor(.mainGreen)
                }
            )
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
