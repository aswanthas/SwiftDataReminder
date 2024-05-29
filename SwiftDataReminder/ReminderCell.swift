//
//  ReminderCell.swift
//  SwiftDataReminder
//
//  Created by Aswanth K on 29/05/24.
//

import SwiftUI

struct ReminderCell: View {
    let data: DataModel
    var body: some View {
        HStack {
            Text(data.name)
        }
    }
}

#Preview {
    ReminderCell(data: DataModel(name: "Reminder Number 1"))
}
