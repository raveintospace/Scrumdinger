//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Uri on 23/9/25.
//

import SwiftUI

struct NewScrumSheet: View {
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: nil)
        }
    }
}

#Preview {
    NewScrumSheet()
}
