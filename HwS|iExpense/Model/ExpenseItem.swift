//
//  ExpenseItem.swift
//  HwS|iExpense
//
//  Created by Daniel Wippermann on 17.08.22.
//

import Foundation

struct ExpenseItem: Identifiable {
    var id = UUID()
    
    let name: String
    let type: String
    let amount: Double
}
