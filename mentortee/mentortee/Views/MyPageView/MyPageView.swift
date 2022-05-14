

import SwiftUI

struct MyPageView: View {
    @Binding var firstNaviLinkActive: Bool
    var username : String = "Chemi"
    var myQuestionCount : Int = 2
    var myAnswerCount : Int = 3
    var userLV : Int = 1
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            
            Text("\(username)의 질문상자")
                .font(.system(size: 24).weight(.bold))
            
            HStack {
                NavigationLink(destination: QuestionCardView(firstNaviLinkActive: $firstNaviLinkActive).navigationBarHidden(true)) {
                        VStack {
                            Text("내가 만든 질문").font(.system(size: 14)).bold()
                            Text("\(myQuestionCount)").font(.system(size: 30)).bold()
                        }
                        .frame(width: (screenWidth - 50) / 2)
                    }
                    .foregroundColor(.black)
                
                Divider()
                
                NavigationLink(destination: AnswerCardView().navigationBarHidden(true)) {
                        VStack {
                            Text("내가 답한 질문").font(.system(size: 14)).bold()
                            Text("\(myAnswerCount)").font(.system(size: 30)).bold()
                        }
                        .frame(width: (screenWidth - 50) / 2)
                    }
                    .foregroundColor(.black)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            }
            .frame(width: 350, height: 100)
            .background(.white)
            .cornerRadius(10)
            
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
                        }.frame(alignment: .leading).padding(10)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 0)
                        Spacer()
                    }
                    HStack {
                        HStack {
                            Text("다음 성장까지")
                            Text("질문 \(myQuestionCount)개, 답변 \(myAnswerCount)개").font(.system(size: 16).weight(.bold))
                            Text("가 필요해요!")
                        }.font(.system(size: 14)).padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white)).shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                        Spacer()
                    }
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(25)
            }
            
            }
            .padding(.top, 15)
            .background(Color.backgroundColor)
        }
    }



struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyPageView(firstNaviLinkActive: .constant(true))
        }
    }
}
