//
//  IncomeSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct IncomeSourceView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 15) {
            Spacer()
            ForEach(Array(IncomeSources().incomes.keys), id: \.self) { key in
                NavigationLink {
                    EditSourceView(name: key, dollarAmnt: IncomeSources().incomes[key]?.amount ?? 0.0, desc: IncomeSources().incomes[key]?.description ?? "")
                } label: {
                    Text("\(key): " + String(format: "%.2f", IncomeSources().incomes[key]?.amount ?? 0))
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
    IncomeSourceView()
}
