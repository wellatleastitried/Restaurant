//
//  IncomeSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct IncomeSourceView: View {
    
    @State var incomes: [String : Sources] = IncomeSources().incomes
    
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
            ForEach(Array(incomes.keys), id: \.self) { key in
                NavigationLink {
                    EditSourceView(isIncome: true, name: key, dollarAmnt: incomes[key]?.amount ?? 0.0, desc: incomes[key]?.description ?? "", sources: incomes)
                } label: {
                    Text("\(key): " + String(format: "%.2f", incomes[key]?.amount ?? 0))
                }
                .bold()
                .foregroundColor(.black)
            }
            Spacer()
            NavigationLink {
                EditSourceView(isIncome: true, name: "", dollarAmnt: 0.0, desc: "", sources: incomes)
            } label: {
                Text("Add a new source")
                    .foregroundStyle(Color.black)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    IncomeSourceView()
}
