
import SwiftUI

struct FeedView_Presentation: View {
    @State private var showModal = false
    @State var click = [true, false, false, false, false, false, false, false, false]
    @State var count = 0
    let screenHeight = UIScreen.main.bounds.height
    
    // 카테고리 - 전체,가치관, 진로, 취향, 취미, 고민, 비밀, 회고, 습관

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack {
                VStack {
                    
                    HStack {
                        ScrollView(.horizontal,
                            showsIndicators: false) {
                            HStack (spacing: 5) {
                                Button("전체") {
                                    count = 1
                                    withAnimation(.easeInOut) {
                                        click[0] = true
                                        for i in 0..<click.count {
                                            if i != 0 {
                                                click[i] = false
                                            }
                                        }
                                    }
                                }
                                    .frame(width: 60, height: 30)
                                    .background(RoundedRectangle(cornerRadius: 40)
                                        .fill(click[0] ? Color.primaryColor : Color.gray))
                                    .foregroundColor(Color.white)

                                Button(action: {
                                    count = 2
                                    withAnimation(.easeInOut) {
                                        click[1] = true
                                        for i in 0..<click.count {
                                            if i != 1 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[1] ? Color.primaryColor : Color.gray))

                                Button(action: {
                                    count = 3
                                    withAnimation(.easeInOut) {
                                        click[2] = true
                                        for i in 0..<click.count {
                                            if i != 2 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[2] ? Color.primaryColor : Color.gray))

                                Button(action: {
                                    count = 4
                                    withAnimation(.easeInOut) {
                                        click[3] = true
                                        for i in 0..<click.count {
                                            if i != 3 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[3] ? Color.primaryColor : Color.gray))

                                Button(action: {
                                    count = 5
                                    withAnimation(.easeInOut) {
                                        click[4] = true
                                        for i in 0..<click.count {
                                            if i != 4 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[4] ? Color.primaryColor : Color.gray))

                                Button(action: {
                                    count = 6
                                    withAnimation(.easeInOut) {
                                        click[5] = true
                                        for i in 0..<click.count {
                                            if i != 5 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[5] ? Color.primaryColor : Color.gray))

                                Button(action: {
                                    count = 7
                                    withAnimation(.easeInOut) {
                                        click[6] = true
                                        for i in 0..<click.count {
                                            if i != 6 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[6] ? Color.primaryColor : Color.gray))

                                Button(action: {
                                    count = 8
                                    withAnimation(.easeInOut) {
                                        click[7] = true
                                        for i in 0..<click.count {
                                            if i != 7 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[7] ? Color.primaryColor : Color.gray))

                                Button(action: {
                                    count = 9
                                    withAnimation(.easeInOut) {
                                        click[8] = true
                                        for i in 0..<click.count {
                                            if i != 8 {
                                                click[i] = false
                                            }
                                        }
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
                                        .fill(click[8] ? Color.primaryColor : Color.gray))
                            }
                                .background(Color.backgroundColor)

                        }
                    }
                    .padding(.all, 16)
                    if count == 0 {
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "가치관",
                                    otherThoughts: "다른 생각 9개",
                                    question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                                    questionOwner: "Chemi",
                                    nickname: "Chemi"
                                )
                                FeedAnswer(category: "취향",
                                    otherThoughts: "다른 생각 9개",
                                    question: "무슨 색을 좋아하나요?",
                                    questionOwner: "noel"
                                )
                                FeedQuestion(category: "회고",
                                    otherThoughts: "다른 생각 9개",
                                    question: "오늘 하루 하려다가 못한 일이 있나요?",
                                    questionOwner: "Chemi",
                                    nickname: "Chemi"
                                )
                                FeedAnswer(category: "회고",
                                    otherThoughts: "다른 생각 9개",
                                    question: "오늘 감사했던 일을 적어주세요!",
                                    questionOwner: "Chemi")
                                FeedQuestion(category: "회고",
                                    otherThoughts: "다른 생각 120개",
                                    question: "오늘 후회되는 일이 있나요? 후회하지 않기 위해서 다음엔 어떻게 하실 건가요?",
                                    questionOwner: "Daon",
                                    nickname: "Chemi"
                                )
                                FeedQuestion(category: "회고",
                                             otherThoughts: "다른 생각 120개",
                                             question: "오늘 하루 행복했던 일에 대해 적어주세요",
                                             questionOwner: "Daon",
                                             nickname: "Chemi"
                                     )
                                FeedQuestion(category: "진로",
                                              otherThoughts: "다른 생각 9개",
                                              question: "최근에 가장 관심갖고 있는 직업이나 직무가 있나요?",
                                              questionOwner: "Chemi",
                                              nickname: "brown"
                                          )
                                          FeedQuestion(category: "진로",
                                              otherThoughts: "다른 생각 10개",
                                              question: "요즘 가장 배우고 싶은 것이 있나요?",
                                              questionOwner: "Brown",
                                              nickname: "Hello"
                                          )
                                FeedQuestion(category: "취향",
                                    otherThoughts: "다른 생각 10개",
                                    question: "요즘 자주 듣는 노래가 있나요?",
                                    questionOwner: "apple",
                                    nickname: "apple"
                                )
                                
                            }
                        }
                    } else if count == 1 { // 전체
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "가치관",
                                    otherThoughts: "다른 생각 9개",
                                    question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                                    questionOwner: "Chemi",
                                    nickname: "Chemi"
                                )
                                FeedAnswer(category: "취향",
                                    otherThoughts: "다른 생각 9개",
                                    question: "무슨 색을 좋아하나요?",
                                    questionOwner: "noel"
                                )
                                FeedQuestion(category: "회고",
                                    otherThoughts: "다른 생각 9개",
                                    question: "오늘 하루 하려다가 못한 일이 있나요?",
                                    questionOwner: "Chemi",
                                    nickname: "Chemi"
                                )
                                FeedAnswer(category: "회고",
                                    otherThoughts: "다른 생각 9개",
                                    question: "오늘 감사했던 일을 적어주세요!",
                                    questionOwner: "Chemi")
                                FeedQuestion(category: "회고",
                                    otherThoughts: "다른 생각 120개",
                                    question: "오늘 후회되는 일이 있나요? 후회하지 않기 위해서 다음엔 어떻게 하실 건가요?",
                                    questionOwner: "Daon",
                                    nickname: "Chemi"
                                )
                                FeedQuestion(category: "회고",
                                             otherThoughts: "다른 생각 120개",
                                             question: "오늘 하루 행복했던 일에 대해 적어주세요",
                                             questionOwner: "Daon",
                                             nickname: "Chemi"
                                     )
                                FeedQuestion(category: "진로",
                                              otherThoughts: "다른 생각 9개",
                                              question: "최근에 가장 관심갖고 있는 직업이나 직무가 있나요?",
                                              questionOwner: "Chemi",
                                              nickname: "brown"
                                          )
                                          FeedQuestion(category: "진로",
                                              otherThoughts: "다른 생각 10개",
                                              question: "요즘 가장 배우고 싶은 것이 있나요?",
                                              questionOwner: "Brown",
                                              nickname: "Hello"
                                          )
                                FeedQuestion(category: "취향",
                                    otherThoughts: "다른 생각 10개",
                                    question: "요즘 자주 듣는 노래가 있나요?",
                                    questionOwner: "apple",
                                    nickname: "apple"
                                )
                            }
                        }
                    } else if count == 2 { // 가치관
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "가치관",
                                    otherThoughts: "다른 생각 9개",
                                    question: "당신이 생각하는 이상적인 삶은 어떤 모습인가요?",
                                    questionOwner: "Chemi",
                                    nickname: "Chemi"
                                )
                            }
                        }
                    } else if count == 3 { //진로
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "진로",
                                    otherThoughts: "다른 생각 9개",
                                    question: "최근에 가장 관심갖고 있는 직업이나 직무가 있나요?",
                                    questionOwner: "Chemi",
                                    nickname: "brown"
                                )
                                FeedQuestion(category: "진로",
                                    otherThoughts: "다른 생각 10개",
                                    question: "요즘 가장 배우고 싶은 것이 있나요?",
                                    questionOwner: "Brown",
                                    nickname: "Hello"
                                )
                            }
                        }
                    } else if count == 4 { //취향
                        ScrollView {
                            VStack {
                                FeedAnswer(category: "취향",
                                    otherThoughts: "다른 생각 9개",
                                    question: "무슨 색을 좋아하나요?",
                                    questionOwner: "noel"
                                )
                                FeedQuestion(category: "취향",
                                    otherThoughts: "다른 생각 10개",
                                    question: "요즘 자주 듣는 노래가 있나요?",
                                    questionOwner: "apple",
                                    nickname: "apple"
                                )
                            }
                        }
                    } else if count == 5 { // 취미
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "취미",
                                    otherThoughts: "다른 생각 10개",
                                    question: "요즘 가장 즐기고 있는 일은 무엇인가요?",
                                    questionOwner: "Brown",
                                    nickname: "Chemi"
                                )
                                FeedQuestion(category: "취미",
                                    otherThoughts: "다른 생각 120개",
                                    question: "이번주 주말에 하고 싶거나 놀러가고 싶은 곳이 있나요?",
                                    questionOwner: "Daon",
                                    nickname: "mylife"
                                )
                            }
                        }
                    } else if count == 6 { // 고민
                        ScrollView {
                            VStack {
                                FeedAnswer(category: "고민",
                                    otherThoughts: "다른 생각 9개",
                                    question: "남들에게 물어보지 못했던 고민이 있나요?",
                                    questionOwner: "Chemi")
                            }
                        }
                    } else if count == 7 { // 비밀
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "비밀",
                                    otherThoughts: "다른 생각 9개",
                                    question: "본인만의 비밀이 있나요? 왜 비밀인가요?",
                                    questionOwner: "102jean",
                                    nickname: "102jean"
                                )
                            }
                        }
                    } else if count == 8 { // 회고
                        ScrollView {
                            VStack {
                                FeedQuestion(category: "회고",
                                    otherThoughts: "다른 생각 9개",
                                    question: "오늘 하루 하려다가 못한 일이 있나요?",
                                    questionOwner: "Chemi",
                                    nickname: "Chemi"
                                )
                                FeedAnswer(category: "회고",
                                    otherThoughts: "다른 생각 9개",
                                    question: "오늘 감사했던 일을 적어주세요!",
                                    questionOwner: "Chemi")
                                FeedQuestion(category: "회고",
                                    otherThoughts: "다른 생각 120개",
                                    question: "오늘 후회되는 일이 있나요? 후회하지 않기 위해서 다음엔 어떻게 하실 건가요?",
                                    questionOwner: "Daon",
                                    nickname: "Chemi"
                                )
                                FeedQuestion(category: "회고",
                                             otherThoughts: "다른 생각 120개",
                                             question: "오늘 하루 행복했던 일에 대해 적어주세요",
                                             questionOwner: "Daon",
                                             nickname: "Chemi"
                                     )
                            }
                        }
                    } else { // 습관
                        ScrollView {
                            VStack {
                                FeedAnswer(category: "습관",
                                    otherThoughts: "다른 생각 9개",
                                    question: "오늘 하루 얼만큼의 물을 마셨나요?",
                                    questionOwner: "켐켐")
                                FeedAnswer(category: "습관",
                                    otherThoughts: "다른 생각 9개",
                                    question: "본인만의 모닝 루틴이 있나요? 일어나자마자 주로 무슨 일을 하시나요?",
                                    questionOwner: "Chemi")
                                FeedAnswer(category: "습관",
                                    otherThoughts: "다른 생각 9개",
                                    question: "매일 7시에 무슨 일을 하고 계신가요?",
                                    questionOwner: "Chemi")
                            }
                        }
                    }
                    
                }
            }
                .offset(y: -30)
                .background(Color.backgroundColor)
        }
    }
}



struct FeedView_Presentation_Previews: PreviewProvider {
    static var previews: some View {
        FeedView_Presentation()
    }
}
