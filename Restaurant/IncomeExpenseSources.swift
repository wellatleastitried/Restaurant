//
//  IncomeSources.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/7/24.
//

import Foundation
import SwiftUI

class IncomeExpenseSources: ObservableObject {
    
    @Published var incomes = [
        "Advertising": Source(amount: 12946.25, description: "Money made from TV commercials."),
        "Food Sales": Source(amount: 28375.84),
        "Catering Services": Source(amount: 8374.39),
        "Misc Merchandies Sales": Source(amount: 1285.28, description: "T-Shirts are sold in the front of the restaurant."),
        "Tips": Source(amount: 439.78)
    ]
    @Published var expenses = [
        "Raw Meat": Source(amount: 10956.69),
        "Kitchen Appliances": Source(amount: 1739.38),
        "Utilities": Source(amount: 4863.89, description: "Electric: $2847.34/month\nWater: $1290.37/month\nOther: $726.18"),
        "Rent": Source(amount: 3839.78),
        "Staff payroll": Source(amount: 12864.84),
        "Sponsors": Source(amount: 6018.86, description: "Celebrities that are payed to endorse out restaurant.")
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
    func calcExpenses() -> Float {
        return getIncomeTotal() / getExpenseTotal() * 100
    }
    func resultOfExpenses() -> Color {
        let result = calcExpenses()
        return result < 100.0 ? Color.red : result == 100.0 ? Color.blue : Color.green
    }
}
