//
//  ExampleToggleGroupView.swift
//  RainbowExamples
//
//  Created by Adam Dahan on 2024-07-25.
//

import SwiftUI
import Rainbow

struct ExampleToggleGroupView: View {
    
    struct ExampleItem: Identifiable, Hashable {
        var id = UUID()
        var name: String
        var description: String
    }
    
    @State private var selectedItems: Set<ExampleItem> = []
    
    private let items = [
        ExampleItem(name: "Option 1", description: "This is some description"),
        ExampleItem(name: "Option 2", description: "This is some description"),
        ExampleItem(name: "Option 3", description: "This is some description")
    ]
    
    var body: some View {
        
        let groupConfiguration = RainbowToggleGroupConfiguration(
            orientation: .vertical,
            spacing: 10,
            toggleConfiguration: .configure(theme: .primary, imageSystemName: "checkmark")
        )
        
        RainbowToggleGroup(
            selectedItems: $selectedItems,
            items: items,
            itemContent: { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }, 
            configuration: groupConfiguration
        )
        .padding()
    }
}
