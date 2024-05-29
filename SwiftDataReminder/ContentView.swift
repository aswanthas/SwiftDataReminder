//
//  ContentView.swift
//  SwiftDataReminder
//
//  Created by Aswanth K on 29/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var context
    @State private var isShowItemSheet: Bool = false
    @Query var data: [DataModel]
    var body: some View {
        NavigationStack {
            List {
                ForEach(data) { reminder in
                    ReminderCell(data: reminder)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(data[index])
                    }
                })
            }
            .navigationTitle("Reminders")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowItemSheet, content: {
                AddReminderSheet()
            })
            .toolbar {
                if !data.isEmpty {
                    Button("Add Reminders", systemImage: "plus") {
                        isShowItemSheet = true
                    }
                }
            }
            .overlay {
                if data.isEmpty {
                    ContentUnavailableView(label: {
                        Label("No Reminders",
                              systemImage: "list.bullet.rectangle.portrait.fill")
                    }, description: {
                        Text("Start adding your reminders")
                    }, actions: {
                        Button("Add") {
                            isShowItemSheet = true
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


struct AddReminderSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var context
    @State private var reminder: String = ""
    var body: some View {
        NavigationStack {
            Form {
                TextField("Reminder", text: $reminder)
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        // save
                        let remiderData = DataModel(name: reminder)
                        context.insert(remiderData)
                        // Assuming context.save() is necessary to persist the data
                        do {
                            try context.save()
                        } catch {
                            // Handle the error appropriately in your app
                            print("Failed to save reminder: \(error.localizedDescription)")
                        }
                        
                        dismiss()
                    }
                }
            })
        }
    }
}
