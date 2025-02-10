//
//  HomeView.swift
//  Wayfinder
//
//  Created by Adam Dahan on 2025-02-10.
//

import SwiftUI
import Wayfinder

struct HomeView: View {
    @EnvironmentObject var wayfinder: Wayfinder<AppRoute>
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home View")
                .font(.largeTitle)
            Button("Go to Detail for Item 1") {
                wayfinder.navigate(to: .detail(itemID: 1), style: .push)
            }
            Button("Present Enter Phone Number as a Sheet") {
                // Standard sheet without detents.
                wayfinder.navigate(to: .enterPhoneNumber, style: .sheet)
            }
            Button("Present Enter Phone Number with Detents") {
                // Sheet with specified detents.
                wayfinder.navigate(to: .enterPhoneNumber, style: .sheetWithDetents(detents: [.medium, .large]))
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

