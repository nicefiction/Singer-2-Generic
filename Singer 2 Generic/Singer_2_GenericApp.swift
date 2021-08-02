//
//  Singer_2_GenericApp.swift
//  Singer 2 Generic
//
//  Created by Olivier Van hamme on 02/08/2021.
//

import SwiftUI

@main
struct Singer_2_GenericApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
