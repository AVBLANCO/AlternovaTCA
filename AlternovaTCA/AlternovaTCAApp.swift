//
//  AlternovaTCAApp.swift
//  AlternovaTCA
//
//  Created by Sergio Luis Noriega Pita on 26/04/24.
//

import SwiftUI

@main
struct AlternovaTCAApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
