//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Uri on 23/9/25.
//

import SwiftUI
import ThemeKit

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingDetailEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            
            Section(header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    HStack {
                        Image(systemName: "calendar")
                        Text(history.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingDetailEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingDetailEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum, saveEdits: { dailyScrum in
                    scrum = editingScrum
                })
                .navigationTitle(scrum.title)
            }
        }
    }
}

#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    NavigationStack {
        DetailView(scrum: $scrum)
    }
}
