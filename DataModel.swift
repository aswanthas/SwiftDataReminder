//
//  DataModel.swift
//  SwiftDataReminder
//
//  Created by Aswanth K on 29/05/24.
//

import Foundation
import SwiftData

@Model
class DataModel: Identifiable {
    var id = UUID()
    var name: String
    init(name: String) {
        self.name = name
    }
}
