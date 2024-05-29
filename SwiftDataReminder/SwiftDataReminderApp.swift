//
//  SwiftDataReminderApp.swift
//  SwiftDataReminder
//
//  Created by Aswanth K on 29/05/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataReminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: [DataModel.self])
    }
}
