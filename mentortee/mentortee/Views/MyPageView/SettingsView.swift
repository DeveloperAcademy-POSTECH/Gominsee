//
//  SettingsView.swift
//  mentortee
//
//  Created by Mingwan Choi on 2022/04/12.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        List {
            Text("닉네임 변경")
            Text("로그아웃")
            Text("버전 정보 1.0.0")
        }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
            dismiss()
        }) {
                Image(systemName: "chevron.backward")
                    .padding(.all, 16)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
            }
        )
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
