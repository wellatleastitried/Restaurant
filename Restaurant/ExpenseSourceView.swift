//
//  ExpenseSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct ExpenseSourceView: View {
    
    @EnvironmentObject var incomeExpenseSources: IncomeExpenseSources
    
    var body: some View {
        NavigationLink {
            MainView()
        } label: {
            Text("Main menu")
        }
        .buttonStyle(.bordered)
        .foregroundStyle(Color.black)
        VStack (alignment: .center, spacing: 15) {
            Spacer()
            Text(String(format: "Total Expense: $%.2f", incomeExpenseSources.getExpenseTotal()))
                .bold()
                .foregroundStyle(Color.red)
            Spacer()
            ForEach(Array(incomeExpenseSources.expenses.keys), id: \.self) { key in
                NavigationLink {
                    EditSourceView(isAdd: false, isIncome: false, name: key, dollarAmnt: incomeExpenseSources.expenses[key]?.amount ?? 0.0, desc: incomeExpenseSources.expenses[key]?.description ?? "")
                } label: {
                    Text("\(key): " + String(format: "$%.2f", incomeExpenseSources.expenses[key]?.amount ?? 0))
                }
                .bold()
                .foregroundColor(.black)
                .buttonStyle(.borderedProminent)
            }
            Spacer()
            NavigationLink {
                EditSourceView(isAdd: true, isIncome: false, name: "", dollarAmnt: 0.0, desc: "")
                    .environmentObject(incomeExpenseSources)
            } label: {
                Text("Add a new source")
                    .foregroundStyle(Color.black)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ExpenseSourceView().environmentObject(IncomeExpenseSources())
}
