//
//  mentorteeApp.swift
//  mentortee
//
//  Created by 김민택 on 2022/04/05.
//

import SwiftUI

@main
struct mentorteeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//struct mentorteeApp: App {
//  let persistentContainer: NSPersistentContainer = {
//      let container = NSPersistentContainer(name: "mentorteeApp")
//      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//          if let error = error as NSError? {
//              fatalError("Unresolved error \(error), \(error.userInfo)")
//          }
//      })
//      return container
//  }()
//
//  var body: some Scene {
//    WindowGroup {
//      ContentView()
//    }
//  }
//}
