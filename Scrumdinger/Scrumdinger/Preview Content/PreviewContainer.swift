//
//  PreviewContainer.swift
//  Scrumdinger
//
//  Created by Uri on 23/9/25.
//

import SwiftData
import SwiftUI

struct DailyScrumSampleData: PreviewModifier {
    
    /// Inserts the contents of DailyScrum.sampleData to the returned ModelContainer
    static func makeSharedContext() async throws -> ModelContainer {
        let container = try ModelContainer(for: DailyScrum.self, configurations: .init(isStoredInMemoryOnly: true))
        DailyScrum.sampleData.forEach { container.mainContext.insert($0) }
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var dailyScrumsSampleData: Self = .modifier(DailyScrumSampleData())
}

/*
 A container manages storage in SwiftData. When you fetch or save data, the container performs the reading and writing of underlying data using information from the schema that you established in your SwiftData models.
 */
