//
//  EnterPhoneNumberView.swift
//  WayfinderExamples
//
//  Created by Adam Dahan on 2025-02-10.
//

import SwiftUI
import Wayfinder

struct EnterPhoneNumberView: View {
    @EnvironmentObject var wayfinder: Wayfinder<AppRoute>
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Enter Phone Number")
                .font(.largeTitle)
            Button("Proceed to Home") {
                wayfinder.dismissSheet()          
            }
        }
        .padding()
    }
}

