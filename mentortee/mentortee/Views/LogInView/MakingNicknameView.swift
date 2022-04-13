//
//  MakingNicknameView.swift
//  mentortee
//
//  Created by Yu ahyeon on 2022/04/11.
//

import SwiftUI

struct Nickname: View {
    @State private var name: String = ""
    let screenWidth1 = UIScreen.main.bounds.size.width
    let screenHeight1 = UIScreen.main.bounds.size.height

    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            VStack {
                VStack {
                    Text("반가워요!")
                        .font(.system(size: 30))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("별명이 뭐에요?")
                        .font(.system(size: 30))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.foregroundColor(.mainGreen)
                    .padding(.bottom, 50)

                HStack {
                    TextField("닉네임을 입력하세요(최대 n자)", text: $name)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 16))
                        .padding(.leading, 10)
                }
                    .padding(.vertical, 15)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white))

                Button(action: {
                }) {
                    RoundedRectangle(cornerRadius: 10.0)
                        .fill(Color.primaryColor)
                        .frame(width: .infinity, height: 50)
                        .overlay(Text("입력완료 :)").foregroundColor(Color.white))
                }
            }.padding(.horizontal, 16)
                .padding(.top, -200)
        }
            .onTapGesture {
            hideKeyboard()
        }
    }
}

struct Nickname_Previews: PreviewProvider {
    static var previews: some View {
        Nickname()
    }
}

