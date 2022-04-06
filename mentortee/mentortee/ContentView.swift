//
//  ContentView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                MainPage().tabItem { Image(systemName: "house").environment(\.symbolVariants, .none) }.tag(1)
                AnswerDetailView().tabItem { Image(systemName: "square.text.square").environment(\.symbolVariants, .none) }.tag(2)
                Text("my qna").tabItem { Image(systemName: "doc.text").environment(\.symbolVariants, .none) }.tag(3)
                Text("my page").tabItem { Image(systemName: "person").environment(\.symbolVariants, .none) }.tag(4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
