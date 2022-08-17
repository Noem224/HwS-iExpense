//
//  ContentView.swift
//  HwS|iExpense
//
//  Created by Daniel Wippermann on 17.08.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                        withAnimation {
                            expenses.items.append(expense)
                        }
                    } label: { Image(systemName: "plus") }
                }
                ToolbarItem {
                    EditButton()
                    
                }
            }
        }
    }
    private func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
