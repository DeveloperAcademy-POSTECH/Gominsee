//
//  mentorteeApp.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/05.
//

import SwiftUI
import Firebase

@main
struct mentorteeApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var userInformation = UserInformation()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userInformation)
        }
    }
}
