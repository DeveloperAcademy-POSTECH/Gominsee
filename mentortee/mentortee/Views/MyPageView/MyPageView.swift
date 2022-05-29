
import SwiftUI

struct MyPageView: View {
    
    @EnvironmentObject var myData : UserInformation
    @Binding var firstNaviLinkActive: Bool
    let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        VStack {
            Text("\(myData.myPageData.username)의 질문상자")
                .foregroundColor(.mainBlack)
                .font(.system(size: 24).weight(.bold))
            HStack {
                NavigationLink(destination: QuestionCardView(firstNaviLinkActive: $firstNaviLinkActive)) {
                    VStack {
                        Text(TextName.myQuestionText)
                            .bold()
                            .font(.system(size: 14))
                        Text("\(myData.myPageData.myQuestionCount)")
                            .bold()
                            .font(.system(size: 30))
                            .opacity(0.8)
                    }
                        .foregroundColor(.mainBlack)
                        .frame(width: (screenWidth - 50) / 2)
                }

                Divider()

                NavigationLink(destination: AnswerCardList()) {
                    VStack {
                        Text(TextName.myAnswerText)
                            .bold()
                            .font(.system(size: 14))

                        Text("\(myData.myPageData.myAnswerCount)")
                            .bold()
                            .font(.system(size: 30))
                            .opacity(0.8)
                    }
                        .foregroundColor(.mainBlack)
                        .frame(width: (screenWidth - 50) / 2)
                }
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
            }
                .frame(width: 350, height: 100)
                .background(.white)
                .cornerRadius(10)

            ZStack {
                VStack {
                    Image.level_1.shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                    Spacer()
                }
                VStack {
                    HStack {
                        HStack {
                            Text(TextName.characterName)
                                .bold()
                                .font(.system(size: 20))
                            Text("Lv. \(myData.myPageData.userLV)")
                                .font(.system(size: 14))
                        }
                            .foregroundColor(.mainBlack)
                            .frame(alignment: .leading).padding(10)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.1), radius: 20, x: 0, y: 0)
                        Spacer()
                    }
                    HStack {
                        HStack {
                            Text("다음 성장까지")
                            Text("질문 \(myData.myPageData.myQuestionCount)개, 답변 \(myData.myPageData.myAnswerCount)개")
                                .bold()
                                .font(.system(size: 16))
                            Text("가 필요해요!")
                        }
                            .foregroundColor(.mainBlack)
                            .font(.system(size: 14))
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
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


//
//struct MyPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyPageView(firstNaviLinkActive: .constant(true))
//    }
//}
