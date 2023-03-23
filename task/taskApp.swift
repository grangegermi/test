//
//  taskApp.swift
//  task
//
//  Created by Даша Волошина on 13.03.23.
//

import SwiftUI

@main
struct taskApp: App {
//    let controller =  PersistenceController.shared
    var body: some Scene {
        WindowGroup {
           ContentView()
//                .environment(\.managedObjectContext, controller.context)
        }
    }
}

func gotoHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: TableView())
           window.makeKeyAndVisible()
       }
}

func gotoSingIN() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
           window.makeKeyAndVisible()
       }
}

