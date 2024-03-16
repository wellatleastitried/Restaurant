//
//  IncomeSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct IncomeSourceView: View {
    
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
            Text(String(format: "Total Income: $%.2f", incomeExpenseSources.getIncomeTotal()))
                .bold()
                .foregroundStyle(Color.green)
            Spacer()
            ForEach(Array(incomeExpenseSources.incomes.keys), id: \.self) { key in
                NavigationLink {
                    EditSourceView(isAdd: false, isIncome: true, name: key, dollarAmnt: incomeExpenseSources.incomes[key]?.amount ?? 0.0, desc: incomeExpenseSources.incomes[key]?.description ?? "")
                } label: {
                    Text("\(key): " + String(format: "$%.2f", incomeExpenseSources.incomes[key]?.amount ?? 0))
                }
                .bold()
                .foregroundColor(.black)
                .buttonStyle(.borderedProminent)
            }
            Spacer()
            HStack {
                NavigationLink {
                    EditSourceView(isAdd: true, isIncome: true, name: "", dollarAmnt: 0.0, desc: "")
                        .environmentObject(incomeExpenseSources)
                } label: {
                    Text("Add a new source")
                        .foregroundStyle(Color.black)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    IncomeSourceView().environmentObject(IncomeExpenseSources())
}
