//
//  ContentView.swift
//  WayfinderExamples
//
//  Created by Adam Dahan on 2025-02-10.
//


import SwiftUI
import Wayfinder

struct ContentView: View {
    
    var body: some View {
        WayfinderContainer<AppRoute>(
             initialRoute: .home,
             viewResolver: { route in
                 resolveView(for: route)
             }
        )
    }
    
    func resolveView(for route: AppRoute) -> AnyView {
        switch route {
        case .enterPhoneNumber:
            return AnyView(EnterPhoneNumberView())
        case .home:
            return AnyView(HomeView())
        case .detail(let itemID):
            return AnyView(DetailView(itemID: itemID))
        }
    }
}

#Preview {
    ContentView()
}
