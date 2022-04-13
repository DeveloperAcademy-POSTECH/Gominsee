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
    @State var firstNaviLinkActive: Bool = false

    var body: some View {
        NavigationView {
            VStack() {
                TabView(selection: $selection) {
                    MainView().tabItem { Image(systemName: "house").environment(\.symbolVariants, .none) }.tag(1)
                    FeedView().tabItem { Image(systemName: "square.text.square").environment(\.symbolVariants, .none) }.tag(2)
                    MyPageView().tabItem { Image(systemName: "person").environment(\.symbolVariants, .none) }.tag(3)
                }
            }
                .navigationBarItems(leading: Text("고민씨")
                    .padding(.all, 16)
                    .font(.system(size: 22)
                        .weight(.bold))
                    .foregroundColor(.primaryColor),
                trailing: NavigationLink(destination: getDestination(), isActive: $firstNaviLinkActive) {
                    Image(systemName: selection == 3 ? "gearshape" : "square.and.pencil")
                        .padding(.all, 16)
                        .font(.system(size: 20))
                        .foregroundColor(.mainGreen)
                }
            )
        }
    }

    func getDestination() -> AnyView {
        if (selection == 3) {
            return AnyView(SettingsView())
        }
        else {
            return AnyView(QuestionMakingMain(firstNaviLinkActive: $firstNaviLinkActive)
                    .navigationBarHidden(true))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
