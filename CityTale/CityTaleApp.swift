//
//  CityTaleApp.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 13/09/22.
//

import SwiftUI

@main
struct CityTaleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
