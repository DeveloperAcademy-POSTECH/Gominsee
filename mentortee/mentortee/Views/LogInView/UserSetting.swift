//
//  UserSetting.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/13.
//

import Foundation
import SwiftUI
import Combine

class UserSetting: ObservableObject {
    @Published var accessToken: String = ""
}
