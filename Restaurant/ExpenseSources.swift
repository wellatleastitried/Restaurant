//
//  ExpenseSources.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/7/24.
//

import Foundation

class ExpenseSources {
    
    public var expenses = [
        "Ab": Sources(amount: 10956.69),
        "Bc": Sources(amount: 15739.38)
    ]
    
    func getTotal() -> Float {
        var total: Float = 0
        for (_, j) in expenses {
            total += j.getAmount()
        }
        return total
    }
    func addExpense(expenseName: String, expenseAmnt: Float) {
        expenses[expenseName] = Sources(amount: expenseAmnt)
    }
    func removeExpense(expense: String) {
        expenses.removeValue(forKey: expense)
    }
}
