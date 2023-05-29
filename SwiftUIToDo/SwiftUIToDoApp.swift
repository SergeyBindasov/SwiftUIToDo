//
//  SwiftUIToDoApp.swift
//  SwiftUIToDo
//
//  Created by Sergey on 29.05.2023.
//

import SwiftUI

@main
struct SwiftUIToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
