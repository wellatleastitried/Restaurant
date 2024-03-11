//
//  EditSourceView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/11/24.
//

import SwiftUI

struct EditSourceView: View {
    
    @State public var name: String
    @State public var dollarAmnt: Float
    @State public var desc: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("Enter the name of the source:")
            TextField("", text: $name)
                .background(Color.white)
            Spacer()
            Text("Enter the amount for the source:")
            TextField("", value: $dollarAmnt, formatter: NumberFormatter())
                .background(Color.white)
            Spacer()
            Text("OPTIONAL: Enter a description of the source:")
            TextField("", text: $desc)
                .background(Color.white)
            Spacer()
            Button {
                IncomeSources().incomes[name] = Sources(amount: dollarAmnt, description: desc)
            } label: {
                Text("Save source information")
                    .foregroundStyle(Color.black)
            }
            .buttonStyle(.bordered)
        }
        .background(Color.gray)
    }
}


#Preview {
    EditSourceView(name: "", dollarAmnt: 0.0, desc: "")
}
