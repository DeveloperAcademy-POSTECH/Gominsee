//
//  ButtonClick.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/04/07.
//

import SwiftUI

struct ButtonClick: View {
    
    @State private var animationAmount = false
 
    var body: some View {
        Button("Tap Me") {
            self.animationAmount.toggle()
        }
        //background 보다 frame이 먼저 와야 한다.
        .frame(width: 100, height: 100)
        .background(Color.blue)
        .foregroundColor(.white)
    }
}

struct ButtonClick_Previews: PreviewProvider {
    static var previews: some View {
        ButtonClick()
    }
}
