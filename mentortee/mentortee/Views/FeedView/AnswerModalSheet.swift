//
//  AnswerModalSheet.swift
//  mentortee
//
//  Created by 이지수 on 2022/04/07.
//

// 1. 키보드 해결

import SwiftUI

struct AnswerModalSheet: View {
    @StateObject private var keyboardHandler = KeyboardHandler()
    @Environment(\.presentationMode) var presentation
    @State private var userAnswer = ""
    @State private var userAnswerArray: [String] = []
    @State private var checked = false
    
    var feedQuestion: String
    
    func saveAnswer() {
        userAnswerArray.append(userAnswer)
        userAnswer = ""
    }
    
    var body: some View {
        GroupBox {
            VStack {
                Text(feedQuestion)
                    .bold()
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil) //줄바꿈 무제한 가능
                    .fixedSize(horizontal: false, vertical: true) //옆으로 비활성화, 여러줄로
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                Divider() //구분선
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
                TextField("질문에 대한 나의 생각을 적어주세요.", text: $userAnswer)
                    .frame(maxWidth: .infinity, maxHeight: 150, alignment: .topLeading)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                
                HStack{
                    Button (action: { self.checked.toggle() }) {
                        HStack{
                            Image(systemName: checked ? "checkmark.circle.fill" : "checkmark.circle").foregroundColor(checked ? Color.mainGreen : Color.gray)
                            Text("내 생각 나만 볼래요").font(.system(size: 14)).foregroundColor(checked ? Color.black : Color.gray)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                
                
                
                Button(action: {
                    saveAnswer()
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("작성완료:)").bold()
                }
                .frame(width: 310, height: 40, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryColor))
                .font(.system(size: 16))
                .foregroundColor(Color.white)
            }
            .padding(keyboardHandler.keyboardHeight)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .padding(.bottom, keyboardHandler.keyboardHeight)
//        .animation(.default) //withanimation
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(hex: 0x000000).opacity(0.7)))

        .ignoresSafeArea(edges: .bottom)
        .background(Color.backgroundColor)
        .onTapGesture {
            hideKeyboard()
        }
    }
}


struct AnswerModalView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerModalSheet(feedQuestion: "hellohellohellohellohellohellohellohellohellohellohello")
    }
}

