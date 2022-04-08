//
//  AnswerModalSheet.swift
//  mentortee
//
//  Created by 이지수 on 2022/04/07.
//

import SwiftUI

//struct TestView: View {  //최종적으로 feedview가 와야함 -> 임시라서 testview
//    @State private var showModal = false
//
//    var body: some View {
//        VStack{
//            Text("다온이 만든 feed card 연결, 다온이 만든 생각적기 버튼누르면 모달 등장")
//            Button(action: {
//                self.showModal = true
//            }){
//                Text("생각적기").bold()
//            }
//            .frame(width: 80, height: 30, alignment: .center)
//            .background(RoundedRectangle(cornerRadius: 10).fill(Color.primaryColor))
//            .font(.system(size: 16))
//            .foregroundColor(Color.white)
//            .sheet(isPresented: self.$showModal) {
//                AnswerModalSheet()
//            }
//        }
//    }
//}


struct AnswerModalSheet: View {
    @StateObject private var keyboardHandler = KeyboardHandler()
    @Environment(\.presentationMode) var presentation
    @State private var userAnswer = ""
    @State private var userAnswerArray: [String] = []
    @State private var checked = false
    
    var feedQuestion = "OOO님이 생각하는 이상적인 삶은 어떤 모cffsdvdasfgadfgdfgsdfgerbfdvedfscaerebvdscythgbrsfvdsvfgtyhfbvfsfgbsgbhsdfgdf습인가요?"
    
    func saveAnswer() {
        userAnswerArray.append(userAnswer)
        userAnswer = ""
    }
    
    var body: some View {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, keyboardHandler.keyboardHeight)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.backgroundColor))
        .ignoresSafeArea(edges: .bottom)
        
    }
}


struct AnswerModalView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerModalSheet()
    }
}

