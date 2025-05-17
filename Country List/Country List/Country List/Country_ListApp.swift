//
//  Country_ListApp.swift
//  Country List
//
//

import SwiftUI
import SwiftData

@main
struct Country_ListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Country.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            CountryListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
