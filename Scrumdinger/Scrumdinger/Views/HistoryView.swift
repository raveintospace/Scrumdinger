//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Uri on 24/9/25.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

#Preview {
    let history = History(attendees: [
        Attendee(name: "John"),
        Attendee(name: "Darla"),
        Attendee(name: "Luis")
    ],
    transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
    HistoryView(history: history)
}

// ListFormatter converts the attendees data into a single, comma-separated string.
extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}
