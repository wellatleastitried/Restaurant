//
//  ContentView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var incomeExpenseSources: IncomeExpenseSources = IncomeExpenseSources()
    
    var body: some View {
        NavigationView {
            NavigationLink {
                MainView()
                    .environmentObject(incomeExpenseSources)
            } label: {
                VStack {
                    Image("DeliMeat")
                        .resizable()
                    Spacer()
                    Text("Jack's Deli Meats")
                        .foregroundStyle(Color.white)
                        .background(Color.brown)
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding()
                .background(Color.gray)
            }
        }
    }
}

#Preview {
    ContentView()
}
