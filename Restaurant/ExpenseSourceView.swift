//
//  ExpenseSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct ExpenseSourceView: View {
    
    @State private var eSources: [String] = []
    @State private var allSources: String = "yes\nno"
    var body: some View {
        VStack {
            Text("Expense Sources:")
                .bold()
            Text(allSources)
        }
    }
}

#Preview {
    ExpenseSourceView()
}
