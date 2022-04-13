//
//  MythoughtModalSheet.swift
//  mentortee
//
//  Created by LeeJiSoo on 2022/04/13.
//

import SwiftUI

struct MythoughtModalSheet: View {
    @Environment(\.presentationMode) var presentation
    var answerDatetime = ["2022.04.23"]
    var myAnswer = ["Hello 내 답변은 이거야"]
    
    var body: some View {
        ZStack{
            List{
                Section(header: Text(answerDatetime[0])) {
                    Text(myAnswer[0])
                }
            }
            .groupBoxStyle(PlainGroupBoxStyle())
        }
    }
}



struct MythoughtModalSheet_Previews: PreviewProvider {
    static var previews: some View {
        MythoughtModalSheet()
    }
}

