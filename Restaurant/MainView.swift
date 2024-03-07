//
//  MainView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var percentage: Int = 50
    
    var body: some View {
        NavigationView {
            VStack (spacing:25) {
                Text("Current profit/loss: \(percentage)%")
                    .multilineTextAlignment(.center)
                    .bold()
                    .kerning(1.25)
                    .frame(maxWidth: .infinity)
                    .frame(maxHeight: 50)
                    .background(Color.white)
                Spacer()
                HStack {
                    // Image in front of button
                    NavigationLink {
                        IncomeSourceView()
                    }
                    label: {
                        Text("View and Modify Income")
                    }
                .buttonStyle(.bordered)
                .tint(Color.white)
                }
                HStack {
                    // Image in front of button
                    NavigationLink {
                        ExpenseSourceView()
                    }
                    label: {
                        Text("View and Modify Expense")
                    }
                .buttonStyle(.bordered)
                .tint(Color.white)
                }
                Spacer()
            }
            .background(Color.gray)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainView()
}
