//
//  ManageReservationView.swift
//  Restaurant
//
//  Created by Swindell, Jack on 3/15/24.
//

import SwiftUI

struct ManageReservationView: View {
    
    private var times: [String] = [
        "6:00 p.m.",
        "6:15 p.m.",
        "6:30 p.m.",
        "6:45 p.m.",
        "7:00 p.m.",
        "7:15 p.m.",
        "7:30 p.m.",
        "7:45 p.m.",
        "8:00 p.m."
    ]
    private var when: [String] = [
        "tonight",
        "tomorrow night",
        "in two days"
    ]
    @State var numReserves: Int = Int.random(in: 1...23)
    @State var indexWhen: Int = Int.random(in: 0...2)
    @State var indexTime: Int = Int.random(in: 0...8)
    
    var body: some View {
        VStack (spacing: 25){
            Text(numReserves != 0 ? "There are currently \(numReserves) reservations." : "There are no reservations.")
                .multilineTextAlignment(.center)
                .bold()
            Text(numReserves != 0 ? "The last reservation is scheduled for \(times[indexTime]) \(when[indexWhen])." : "")
                .multilineTextAlignment(.center)
                .bold()
            Button {
                if numReserves > 0 {
                    numReserves -= 1
                }
            } label: {
                Text("Remove Reservation")
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ManageReservationView()
}
