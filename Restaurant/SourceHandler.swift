//
//  IncomeSourceHandler.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/7/24.
//

import Foundation

class SourceHandler {
    
    public var percentage: Int = 0
    
    func calcExpenses() -> Float {
        return IncomeSources().getTotal() / ExpenseSources().getTotal() * 100
    }
    
}
