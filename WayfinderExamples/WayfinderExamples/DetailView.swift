//
//  DetailView.swift
//  Wayfinder
//
//  Created by Adam Dahan on 2025-02-10.
//

import SwiftUI

struct DetailView: View {
    let itemID: Int
    
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.title)
            Text("Item ID: \(itemID)")
        }
        .padding()
    }
}
