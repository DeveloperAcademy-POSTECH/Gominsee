//
//  TapView.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/05.
//

import SwiftUI

struct TapView: View {
    var body: some View {
        VStack {
            TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
                Text("home").tabItem { Image(systemName: "house").environment(\.symbolVariants, .none) }.tag(1)
                    
                Text("feed").tabItem { Image(systemName: "square.text.square").environment(\.symbolVariants, .none) }.tag(2)
                
                Text("my page").tabItem { Image(systemName: "person").environment(\.symbolVariants, .none) }.tag(4)
            }
        }
    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
