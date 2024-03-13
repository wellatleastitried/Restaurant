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
    @State public var sources: [String : Sources]
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
            
            NavigationLink(destination: IncomeSourceView(incomes: sources)
                .onAppear {
                    sources[name] = Sources(amount: dollarAmnt, description: desc)
                }, label: {Text("Save source information").foregroundStyle(Color.white)}
                )
        }
        .background(Color.gray)
    }
}


#Preview {
    EditSourceView(isIncome: true, name: "", dollarAmnt: 0.0, desc: "", sources: ["Test": Sources(amount: 1500.76, description: "")])
}
