//
//  AppRoute.swift
//  Wayfinder
//
//  Created by Adam Dahan on 2025-02-10.
//

import Wayfinder

enum AppRoute: Routable {
    case enterPhoneNumber
    case home
    case detail(itemID: Int)
    
    // Conformance to Identifiable.
    var id: String {
        switch self {
        case .enterPhoneNumber:
            return "enterPhoneNumber"
        case .home:
            return "home"
        case .detail(let itemID):
            return "detail_\(itemID)"
        }
    }
}

