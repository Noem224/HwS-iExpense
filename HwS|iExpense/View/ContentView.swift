//
//  ContentView.swift
//  HwS|iExpense
//
//  Created by Daniel Wippermann on 17.08.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(ExpenseItem.ExpenseType.allCases, id: \.self) { type in
                    Section(type.rawValue) {
                        ForEach(expenses.items.filter({$0.type == type})) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type.rawValue)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: "USD"))
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddExpenseView(expenses: expenses)
            })
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showingAddExpense = true
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
