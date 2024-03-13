//
//  IncomeSourceHandler.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/7/24.
//

import Foundation
import SwiftUI

class SourceHandler {
    
    public var percentage: Int = 0
    
    func calcExpenses() -> Float {
        return IncomeSources().getTotal() / ExpenseSources().getTotal() * 100
    }
    func resultOfExpenses() -> Color {
        let result = calcExpenses()
        return result < 100.0 ? Color.red : result == 100.0 ? Color.blue : Color.green
    }
}
