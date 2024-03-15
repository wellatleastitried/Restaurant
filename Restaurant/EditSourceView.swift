//
//  EditSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/11/24.
//

import SwiftUI

struct EditSourceView: View {
    public var isIncome: Bool
    @State public var name: String
    @State public var dollarAmnt: Float
    @State public var desc: String
    @EnvironmentObject public var sources: IncomeExpenseSources
    @State private var savePressed: Bool = false
    private let formatter: NumberFormatter = NumberFormatter()
    var body: some View {
        VStack {
            Spacer()
            Text("Enter the name of the source:")
            TextField("", text: $name, axis: .vertical)
                .background(Color.white)
            Spacer()
            Text("Enter the amount for the source:")
            TextField("", value: $dollarAmnt, format: .currency(code: "USD"))
                .background(Color.white)
            Spacer()
            Text("OPTIONAL: Enter a description of the source:")
            TextField("", text: $desc, axis: .vertical)
                .background(Color.white)
            Spacer()
            HStack (spacing: 50){
                Button {
                    isIncome ? saveIncome() : saveExpense()
                } label: {
                    Text("Save source")
                        .foregroundStyle(Color.white)
                        .buttonStyle(.bordered)
                }
                Button {
                    isIncome ? removeIncome() : removeExpense()
                } label: {
                    Text("Remove source")
                        .foregroundStyle(Color.white)
                        .buttonStyle(.bordered)
                }
            }
        }
        .background(Color.gray)
    }
    func saveIncome() {
        if sources.incomes[name] == nil {
            sources.incomes[name] = Source(amount: dollarAmnt, description: desc)
        }
    }
    func saveExpense() {
        if sources.expenses[name] == nil {
            sources.expenses[name] = Source(amount: dollarAmnt, description: desc)
        }
    }
    func removeIncome() {
        sources.removeIncome(income: name)
    }
    func removeExpense() {
        sources.removeExpense(expense: name)
    }
}
#Preview {
    EditSourceView(isIncome: true, name: "", dollarAmnt: 0.0, desc: "")
}
