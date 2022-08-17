//
//  Expenses.swift
//  HwS|iExpense
//
//  Created by Daniel Wippermann on 17.08.22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
                items = decoded
                return
            }
        }
        items = []
    }
}
