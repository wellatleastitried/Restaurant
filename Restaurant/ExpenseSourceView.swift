//
//  ExpenseSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct ExpenseSourceView: View {
    
    var body: some View {
        VStack (alignment: .center, spacing: 15) {
            Spacer()
            ForEach(Array(ExpenseSources().expenses.keys), id: \.self) { key in
                NavigationLink {
                    EditSourceView(name: key, dollarAmnt: ExpenseSources().expenses[key]?.amount ?? 0.0, desc: ExpenseSources().expenses[key]?.description ?? "")
                } label: {
                    Text("\(key): " + String(format: "%.2f", ExpenseSources().expenses[key]?.amount ?? 0))
                }
                .bold()
                .foregroundColor(.black)
            }
            Spacer()
            NavigationLink {
                EditSourceView(name: "", dollarAmnt: 0.0, desc: "")
            } label: {
                Text("Add a new source")
                    .foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    ExpenseSourceView()
}
