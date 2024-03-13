//
//  ExpenseSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct ExpenseSourceView: View {
    
    @State var expenses: [String : Sources] = ExpenseSources().expenses
    
    var body: some View {
        NavigationLink {
            MainView()
        } label: {
            Text("Main menu")
        }
        VStack (alignment: .center, spacing: 15) {
            Spacer()
            ForEach(Array(expenses.keys), id: \.self) { key in
                NavigationLink {
                    EditSourceView(isIncome: false, name: key, dollarAmnt: expenses[key]?.amount ?? 0.0, desc: expenses[key]?.description ?? "", sources: expenses)
                } label: {
                    Text("\(key): " + String(format: "%.2f", expenses[key]?.amount ?? 0))
                }
                .bold()
                .foregroundColor(.black)
            }
            Spacer()
            NavigationLink {
                EditSourceView(isIncome: false, name: "", dollarAmnt: 0.0, desc: "", sources: expenses)
            } label: {
                Text("Add a new source")
                    .foregroundStyle(Color.black)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ExpenseSourceView()
}
