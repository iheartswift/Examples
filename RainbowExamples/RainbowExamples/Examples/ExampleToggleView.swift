//
//  ExampleTogglesView.swift
//  RainbowExamples
//
//  Created by Adam Dahan on 2024-07-25.
//

import SwiftUI
import Rainbow

struct ExampleToggleView: View {
    
    @State private var isToggled = false
        
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    standard
                    light
                }
                .padding()
                VStack(alignment: .leading) {
                    rectangle
                    circle
                }
                .padding()
            }
        }
    }
    
    @ViewBuilder
    var standard: some View {
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .primary, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .link, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .info, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .success, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .warning, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .danger, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
    }
    
    @ViewBuilder
    var light: some View {
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .primaryLight, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .linkLight, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .infoLight, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .successLight, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .warningLight, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .dangerLight, imageSystemName: "checkmark"),
                isToggled: $isToggled
            )
    }
    
    @ViewBuilder
    var circle: some View {
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .outlinedPrimary, imageSystemName: "circle.fill", shape: .circle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .outlinedLink, imageSystemName: "circle.fill", shape: .circle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .outlinedInfo, imageSystemName: "circle.fill", shape: .circle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .outlinedSuccess, imageSystemName: "circle.fill", shape: .circle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .outlinedWarning, imageSystemName: "circle.fill", shape: .circle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .outlinedDanger, imageSystemName: "circle.fill", shape: .circle),
                isToggled: $isToggled
            )
    }
    
    @ViewBuilder
    var rectangle: some View {
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .primaryInverted, imageSystemName: "checkmark", shape: .rectangle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .linkInverted, imageSystemName: "checkmark", shape: .rectangle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .infoInverted, imageSystemName: "checkmark", shape: .rectangle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .successInverted, imageSystemName: "checkmark", shape: .rectangle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .warningInverted, imageSystemName: "checkmark", shape: .rectangle),
                isToggled: $isToggled
            )
        Text("Tap me")
            .rainbowToggle(
                .configure(theme: .dangerInverted, imageSystemName: "checkmark", shape: .rectangle),
                isToggled: $isToggled
            )
    }
}
