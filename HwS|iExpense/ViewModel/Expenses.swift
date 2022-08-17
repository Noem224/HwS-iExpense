//
//  Expenses.swift
//  HwS|iExpense
//
//  Created by Daniel Wippermann on 17.08.22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
