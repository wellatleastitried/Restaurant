//
//  IncomeSources.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/7/24.
//

import Foundation

class IncomeExpenseSources: ObservableObject {
    
    @Published var incomes = [
        "Advertising": Source(amount: 12946.25),
        "Sponsors": Source(amount: 2018.86),
        "Customers": Source(amount: 8375.84)
    ]
    @Published var expenses = [
        "Raw Meat": Source(amount: 10956.69),
        "Kitchen Appliances": Source(amount: 15739.38)
    ]
    
    func getIncomeTotal() -> Float {
        var total: Float = 0
        for (_, j) in incomes {
            total += j.getAmount()
        }
        return total
    }
    func getExpenseTotal() -> Float {
        var total: Float = 0
        for (_, j) in expenses {
            total += j.getAmount()
        }
        return total
    }
    func addIncome(incomeName: String, incomeAmnt: Float) {
        incomes[incomeName] = Source(amount: incomeAmnt)
    }
    func removeIncome(income: String) {
        incomes.removeValue(forKey: income)
    }
    func addExpense(expenseName: String, expenseAmnt: Float) {
        expenses[expenseName] = Source(amount: expenseAmnt)
    }
    func removeExpense(expense: String) {
        expenses.removeValue(forKey: expense)
    }
}
