//
//  UserInformation.swift
//  mentortee
//
//  Created by Jisu Jang on 2022/05/21.
//

import Foundation

final class UserInformation : ObservableObject {
    @Published var myPageData : MyPageData = MyPageData(username: "Chemi", myQuestionCount: 0, myAnswerCount: 0, userLV: 0)
}
