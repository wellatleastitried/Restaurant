//
//  MainView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/6/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var percentage: Int = Int(SourceHandler().calcExpenses())
    @State private var textColor: Color = SourceHandler().resultOfExpenses()
    
    var body: some View {
        NavigationView {
            VStack (spacing:25) {
                HStack {
                    Text("Current profit/loss: \(percentage)%")
                        .foregroundStyle(textColor)
                        .multilineTextAlignment(.center)
                        .bold()
                        .kerning(1.25)
                        .frame(maxWidth: .infinity)
                        .frame(maxHeight: 50)
                        .background(Color.white)
                }
                Spacer()
                Image("Percentage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                HStack {
                    AsyncImage(url: URL(string: "https://unsplash.com/photos/lCPhGxs7pww/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTF8fGV4cGVuc2V8ZW58MHx8fHwxNzEwMTgyMDcyfDA&force=true")) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
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
                    AsyncImage(url: URL(string: "https://unsplash.com/photos/xkArbdUcUeE/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mnx8ZXhwZW5zZXxlbnwwfHx8fDE3MTAxODIwNzJ8MA&force=true")) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }
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
