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
        VStack (alignment: .center, spacing: 15) {
            Spacer()
            ForEach(Array(incomeExpenseSources.expenses.keys), id: \.self) { key in
                NavigationLink {
                    EditSourceView(isIncome: false, name: key, dollarAmnt: incomeExpenseSources.expenses[key]?.amount ?? 0.0, desc: incomeExpenseSources.expenses[key]?.description ?? "")
                } label: {
                    Text("\(key): " + String(format: "$%.2f", incomeExpenseSources.expenses[key]?.amount ?? 0))
                }
                .bold()
                .foregroundColor(.black)
            }
            Spacer()
            NavigationLink {
                EditSourceView(isIncome: false, name: "", dollarAmnt: 0.0, desc: "")
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
