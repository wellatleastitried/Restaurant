//
//  IncomeSources.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/7/24.
//

import Foundation

class IncomeSources {
    
    public var incomes = [
        "Ab": Sources(amount: 12946.25),
        "Bc": Sources(amount: 2018.86)
    ]
    
    func getTotal() -> Float {
        var total: Float = 0
        for (_, j) in incomes {
            total += j.getAmount()
        }
        return total
    }
    func addIncome(incomeName: String, incomeAmnt: Float) {
        incomes[incomeName] = Sources(amount: incomeAmnt)
    }
    func removeIncome(income: String) {
        incomes.removeValue(forKey: income)
    }
}
