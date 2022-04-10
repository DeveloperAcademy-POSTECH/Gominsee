//
//  ContentView.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/05.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 1
    @State private var isShowingDetailView = false
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                MainView().tabItem { Image(systemName: "house").environment(\.symbolVariants, .none) }.tag(1)
                QuestionDetailView(nickname: "noel").tabItem { Image(systemName: "square.text.square").environment(\.symbolVariants, .none) }.tag(2)
                MyPageView().tabItem { Image(systemName: "person").environment(\.symbolVariants, .none) }.tag(3)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
