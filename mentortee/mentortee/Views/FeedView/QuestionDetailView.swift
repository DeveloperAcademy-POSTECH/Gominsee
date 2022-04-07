//
//  QuestionDetailView.swift
//  mentortee
//
//  Created by Yu ahyeon on 2022/04/06.
//

import SwiftUI

struct QuestionDetailView: View {
    var body: some View {
        
//        @State var ShowingOption: bool = false
//        @State var selection = "None"
        
        NavigationView {
            VStack {
                QuestionView()
            }
            .frame(alignment: .top)
            .navigationBarItems(leading: Button(action: { // do something
                }) { Image(systemName: "arrow.left")
                    .imageScale(.large)
                    }, trailing: Button(action: {
                                // do something
                            }) { Image(systemName: "ellipsis")
                                .imageScale(.large)
                            })
        }
        

    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView()
    }
}
