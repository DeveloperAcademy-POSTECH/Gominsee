//
//  MainView.swift
//  mentortee
//
//  Created by Mingwan Choi on 2022/04/06.
//

import SwiftUI

struct MainView: View {
    
    var dailyQuestion = "Chemi님은 뭘 할 때 행복한가요 ?"
    var categoryList = ["가치관"]
    var today = Date()
    
    @State private var answerText = "질문에 대한 나의 생각을 적어보세요."
    @State private var answerColor = Color.black.opacity(0.2)
    @State private var showAlert = false
    @State private var cardHeight = UIScreen.main.bounds.height * 0.45
    @State private var cardTextHeight = UIScreen.main.bounds.height * 0.2
    @State private var cardOpacity : Double = 1
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .center, spacing: -10) {
                        
                        VStack(alignment: .leading){
                            Text("\(today, formatter: MainView.dateformat)")
                                .bold()
                            Text(dailyQuestion)
                                .bold()
                                .font(.system(size: 35))
                                .frame(width: nil, height: geo.size.height * 0.2)
                                .minimumScaleFactor(0.5)
                            
                            HStack {
                                ForEach(categoryList, id: \.self) { value in
                                    Text(value)
                                        .padding(.vertical, 3)
                                        .padding(.horizontal, 10)
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.primaryColor)
                                        .background(RoundedRectangle(cornerRadius: 10))
                                }
                                Spacer()
                            }
                            
                            VStack{
                                
                                Button("제출하기", action: answerText.count == 0 || answerText == "질문에 대한 나의 생각을 적어보세요." ? {} : {
                                    showAlert = true
                                    hideKeyboard()
                                    answerColor = Color.black.opacity(0.2)
                                    answerText = "질문에 대한 나의 생각을 적어보세요."
                                    cardHeight = geo.size.height * 0.45
                                    cardTextHeight = geo.size.height * 0.2
                                    
                                })
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                .foregroundColor(answerText.count == 0 || answerText == "질문에 대한 나의 생각을 적어보세요." ? Color.mainGreen.opacity(0.4) : Color.mainGreen)
                                .background(
                                    RoundedRectangle(cornerRadius: 10))
                                .alert(isPresented: $showAlert) {
                                    Alert(
                                        title: Text("제출 완료"),
                                        message: Text("마이페이지에서 확인할 수 있어요!")
                                    )
                                }
                            }
                            .frame(width: geo.size.width * 0.8,alignment: .trailing)
                            .padding(.top, 50)
                        }
                        .padding()
                        .frame(width: geo.size.width * 0.87, height: geo.size.height * 0.5)
                        .foregroundColor(.white)
                        .background(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color.primaryColor, Color.subIvory]),
                                startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(10)
                        .opacity(cardOpacity)
                        
                        
                        TextEditor(text: $answerText)
                            .padding()
                            .frame(width: geo.size.width * 0.87, height: geo.size.width * 0.5, alignment: .top)
                            .foregroundColor(answerColor)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 0)
                            .onTapGesture {
                                if answerText == "질문에 대한 나의 생각을 적어보세요."{
                                    answerText = ""
                                }
                                answerColor = Color.black
                                cardOpacity = 0.7

                            }
                        Spacer()
                    }
                }.padding(.top,15)
            }
            .onTapGesture {
                hideKeyboard()
                cardOpacity = 1.0
            }
        }
    }
    
    
    static let dateformat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.dateFormat = "YY년 M월 d일 (eeee)"
        return formatter
    }()
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
