//
//  ExpenseItem.swift
//  HwS|iExpense
//
//  Created by Daniel Wippermann on 17.08.22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    
    let name: String
    let type: ExpenseType
    let amount: Double
    
    enum ExpenseType: String, Codable, CaseIterable {
        case personal = "Personal"
        case business = "Business"
    }
}

