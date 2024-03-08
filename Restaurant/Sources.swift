//
//  File.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/7/24.
//

import Foundation

class Sources {
    
    public var amount: Float
    public var description: String
    
    init(amount: Float, description: String? = nil) {
        self.amount = amount
        if (description != nil) {
            self.description = description!
        } else {
            self.description = ""
        }
    }
    func getAmount() -> Float {
        return self.amount
    }
}
