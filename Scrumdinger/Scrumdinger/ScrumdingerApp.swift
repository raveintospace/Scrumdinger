//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Uri on 23/9/25.
//

import SwiftUI
import SwiftData

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(for: DailyScrum.self)
    }
}

/*
 Setting the model container injects a model context into the SwiftUI environment.
 This context manages changes to the in-memory model objects, propagate changes to SwiftUI, and write changes to disk when appropriate.
 */
