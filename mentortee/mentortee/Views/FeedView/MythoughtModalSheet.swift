//
//  MythoughtModalSheet.swift
//  mentortee
//
//  Created by LeeJiSoo on 2022/04/13.
//

import SwiftUI

struct MythoughtModalSheet: View {
    @Environment(\.presentationMode) var presentation
    var answerDatetime = ["2022.04.14"]
    var myAnswer = ["보라색"]
    
    var body: some View {
       
            ZStack{
                VStack {
                    List{
                        Section(header: Text(answerDatetime[0])) {
                            Text(myAnswer[0])
                        }
                    }
                    .groupBoxStyle(PlainGroupBoxStyle())
                    
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("닫기").bold()
                            .frame(width: 310, height: 40, alignment: .center)
                    })
                    .frame(width: 310, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundColor))
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                }
                .background(Color.backgroundColor)
            }
        }
    }



struct MythoughtModalSheet_Previews: PreviewProvider {
    static var previews: some View {
        MythoughtModalSheet()
    }
}

