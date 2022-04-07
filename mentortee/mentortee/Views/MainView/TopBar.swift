//
//  TopBar.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/05.
//

import SwiftUI

public let main_orange = Color(red: 0.22, green: 0.141, blue: 0.108)

struct TopBar: View {
    
 
    var body: some View {
        NavigationView {
            
            VStack {
                NavigatorView ()
                    .padding()
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            
            TapView()
        }
}

    
struct NavigatorView: View {
    var body: some View {
            HStack {
                Text("고민씨")
                    .font(.title2)
                    .contentShape(Rectangle())
                    .foregroundStyle(main_orange)
                
                Spacer()
                
                NavigationLink(destination: SecondaryView()) {
                    Image(systemName: "square.and.pencil")
                        .scaledToFit()
                }
                
            }
        }
    }
}


struct SecondaryView: View {
    var body: some View {
        Text("Here is Secondary View")
    }
}


struct Topbar_Previwer: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}

