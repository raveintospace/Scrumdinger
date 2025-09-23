//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Uri on 23/9/25.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
