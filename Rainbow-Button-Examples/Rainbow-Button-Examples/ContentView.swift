//
//  ContentView.swift
//
//
//  Created by Adam Dahan on 2024-06-11.
//

import SwiftUI
import Rainbow

/// The main view of the application showcasing different button styles.
struct ContentView: View {
    
    /// State variable to manage the loading state of buttons.
    @State var isLoading: Bool = false
    
    var body: some View {
        contentView
    }
    
    /// The main content view, which is a scrollable view containing various button examples.
    private var contentView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                title
                circleButtonExamples
                outlinedButtonExamples
                standardButtonExamples
                darkmodeButtonExamples
                invertedButtonExamples
                lightButtonExamples
                roundedButtonExamples
                customSizeExamples
                customBorderExamples
            }
            .padding()
        }
    }
    
    /// The title view displaying the main heading of the content.
    private var title: some View {
        Text("# Buttons")
            .font(.title)
            .fontWeight(.bold)
    }
    
    /// The subtitle view providing additional information about the button themes.
    private var subtitle: some View {
        Text("The button is available in all the different kinds of themes.")
            .font(.body)
    }
    
    /// Toggles the loading state of buttons for a duration of 2 seconds.
    private func triggerLoading() {
        isLoading.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            isLoading.toggle()
        })
    }
    
    /// Creates a header view with the given text.
    /// - Parameter text: The text to display in the header.
    /// - Returns: A view displaying the header.
    private func header(text: String) -> some View {
        Text(text)
            .font(.headline)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(Color(.systemPurple).opacity(0.1))
            .cornerRadius(5)
    }
}

// MARK: - Button Example Views

extension ContentView {
    
    /// Custom examples
    var rainbowWalletConfig: RainbowButtonConfiguration {
        return RainbowButtonConfigurationBuilder()
            .setShape(type: .capsule)
            .setLoader(.rainbow)
            .setTheme(RainbowColorTheme(background: .clear, foreground: .white, selected: .yellow.opacity(0.2)))
            .setShadow(RainbowShadowOptions())
            .setBackgroundGradient(RainbowGradientOptions(colors: [
                    Color(red: 0.87, green: 0.29, blue: 0.61), // Approximate pink/purple
                    Color(red: 0.98, green: 0.42, blue: 0.41), // Approximate middle color (pink/orange)
                    Color(red: 0.99, green: 0.75, blue: 0.29)  // Approximate orange/yellow
                ])
            )
            .setSize(.jumbo)
            .build()
    }
    
    /// Custom examples
    var rainbowWalletGlowConfig: RainbowButtonConfiguration {
        return RainbowButtonConfigurationBuilder()
            .setShape(type: .capsule)
            .setLoader(.rainbow)
            .setSound(RainbowSoundOptions(selectedSound: .tap))
            .setHaptic(RainbowHapticOptions(selectedHaptic: .heavy))
            .setSize(.jumbo)
            .setBounce(.subtle)
            .setTheme(RainbowColorTheme(background: .black, foreground: .white, selected: .yellow.opacity(0.2)))
            .setShadow(RainbowShadowOptions(color: .white.opacity(0.2), radius: 4.0, x: 1, y: 1))
            .setBorder(RainbowBorderOptions(
                    colors:[
                        Color(red: 0.87, green: 0.29, blue: 0.61),
                        Color(red: 0.98, green: 0.42, blue: 0.41),
                        Color(red: 0.99, green: 0.75, blue: 0.29)
                    ],
                    width: 5.0,
                    animationOptions: RainbowBorderAnimationOptions(interval: 0.5)
                )
            )
            .setContentGradient(RainbowGradientOptions(colors: [
                Color(red: 0.87, green: 0.29, blue: 0.61),
                Color(red: 0.98, green: 0.42, blue: 0.41),
                Color(red: 0.99, green: 0.75, blue: 0.29)
            ]))
            .build()
    }
    
    /// Rainbow border configuration
    var rainbowBorderConfig: RainbowButtonConfiguration {
        return RainbowButtonConfigurationBuilder()
            .setShape(type: .capsule)
            .setLoader(.rainbow)
            .setBorder(RainbowBorderOptions(
                    colors: [
                        .blue,
                        .yellow,
                        .green,
                        .orange
                    ],
                    width: 5.0,
                    dashPattern: [10]
                )
            )
            .setContentGradient(RainbowGradientOptions(colors: [
                    .blue,
                    .yellow,
                    .green,
                    .orange
                ])
            )
            .setSize(.jumbo)
            .build()
    }
    
    @ViewBuilder
    var circleButtonExamples: some View {
        header(text: "Circle")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: -10) {
                Image(systemName: "heart")
                    .rainbowButton(.button(.outlined(.primary), .circle)) {
                        print("Primary button tapped")
                    }
                Image(systemName: "heart")
                    .rainbowButton(.button(.linkLight, .circle)) {
                        print("Primary button tapped")
                    }
                Image(systemName: "heart")
                    .rainbowButton(.button(.info, .circle)) {
                        print("Primary button tapped")
                    }
                Image(systemName: "heart")
                    .rainbowButton(.button(.success, .circle)) {
                        print("Primary button tapped")
                    }
                Image(systemName: "heart")
                    .rainbowButton(.button(.warningLight, .circle)) {
                        print("Primary button tapped")
                    }
                Image(systemName: "heart")
                    .rainbowButton(.button(.dangerLight, .circle)) {
                        print("Primary button tapped")
                    }
            }
            #if os(tvOS)
            .padding()
            #endif
        }
    }
    
    @ViewBuilder
    var customBorderExamples: some View {
        header(text: "Custom borders")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                HStack {
                    Image(systemName: "heart")
                    Text("iheartswift")
                }
                .rainbowButton(rainbowWalletGlowConfig, .jumbo, isLoading: $isLoading) {
                    triggerLoading()
                }
                
                HStack {
                    Image(systemName: "heart")
                    Text("iheartswift")
                }
                .rainbowButton(rainbowBorderConfig, .jumbo, isLoading: $isLoading) {
                    triggerLoading()
                }
                
                HStack {
                    Image(systemName: "heart")
                    Text("iheartswift")
                }
                .rainbowButton(rainbowWalletConfig, .jumbo, isLoading: $isLoading) {
                    triggerLoading()
                }
                #if os(tvOS)
                .padding()
                #endif
            }
        }
    }
    
    /// Outlined buttons
    
    @ViewBuilder
    var outlinedButtonExamples: some View {
        header(text: "Outlined")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("Outlined")
                    .rainbowButton(.outlined(.primary), isLoading: $isLoading) {
                        print("Outlined pressed")
                        triggerLoading()
                    }
                Text("Outlined")
                    .rainbowButton(.outlined(.link), isLoading: $isLoading) {
                        print("Outlined pressed")
                        triggerLoading()
                    }
                Text("Outlined")
                    .rainbowButton(.outlined(.info), isLoading: $isLoading) {
                        print("Outlined pressed")
                        triggerLoading()
                    }
                Text("Outlined")
                    .rainbowButton(.outlined(.success), isLoading: $isLoading) {
                        print("Outlined pressed")
                        triggerLoading()
                    }
                Text("Outlined")
                    .rainbowButton(.outlined(.warning), isLoading: $isLoading) {
                        print("Outlined pressed")
                        triggerLoading()
                    }
                HStack(spacing: 5.0) {
                    Image(systemName: "heart")
                    Text("iheartswift")
                }
                .rainbowButton(.outlined(.danger), isLoading: $isLoading) {
                    triggerLoading()
                }
                #if os(tvOS)
                .padding()
                #endif
            }
        }
    }
    
    /// Standard buttons
    
    @ViewBuilder
    var standardButtonExamples: some View {
        header(text: "Standard")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("White")
                    .rainbowButton(.white) {
                        print("White button tapped")
                    }
                Text("Light")
                    .rainbowButton(.light) {
                        print("Light button tapped")
                    }
                Text("Dark")
                    .rainbowButton(.dark, .medium) {
                        print("Dark button tapped")
                    }
                Text("Black")
                    .rainbowButton(.black, .small) {
                        print("Black button tapped")
                    }
                Text("Text")
                    .rainbowButton(.text) {
                        print("Text button tapped")
                    }
                Text("Ghost")
                    .rainbowButton(.ghost) {
                        print("Ghost button tapped")
                    }
            }
            #if os(tvOS)
            .padding()
            #endif
        }
    }
    
    /// Darkmode button examples
    
    @ViewBuilder
    var darkmodeButtonExamples: some View {
        header(text: "Darkmode")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("Primary")
                    .rainbowButton(.primary) {
                        print("Primary button tapped")
                    }
                Text("Link")
                    .rainbowButton(.link) {
                        print("Link button tapped")
                    }
                Text("Info")
                    .rainbowButton(.info) {
                        print("Info button tapped")
                    }
                Text("Success")
                    .rainbowButton(.success) {
                        print("Success button tapped")
                    }
                Text("Warning")
                    .rainbowButton(.warning) {
                        print("Warning button tapped")
                    }
                Text("Danger")
                    .rainbowButton(.danger) {
                        print("Danger button tapped")
                    }
            }
            #if os(tvOS)
            .padding()
            #endif
        }
    }
    
    /// Rounded button examples
    
    @ViewBuilder
    var roundedButtonExamples: some View {
        header(text: "Rounded")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("💯 Primary")
                    .rainbowButton(.button(.primary, .capsule, .small)) {
                        print("Primary button tapped")
                    }
                Text("🔗 Link")
                    .rainbowButton(.button(.link, .capsule, .normal)) {
                        print("Link button tapped")
                    }
                Text("ℹ️ Info")
                    .rainbowButton(.button(.info, .capsule, .medium)) {
                        print("Info button tapped")
                    }
                Text("✅ Success")
                    .rainbowButton(.button(.success, .capsule, .large)) {
                        print("Success button tapped")
                    }
                Text("⚠️ Warning!")
                    .rainbowButton(.button(.warning, .capsule, .extraLarge)) {
                        print("Warning button tapped")
                    }
                Text("⛔️ Danger")
                    .rainbowButton(.button(.danger, .capsule, .jumbo)) {
                        print("Danger button tapped")
                    }
            }
            #if os(tvOS)
            .padding()
            #endif
        }
    }
    
    /// Inverted button examples
    
    @ViewBuilder
    var invertedButtonExamples: some View {
        header(text: "Inverted")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("Primary")
                    .rainbowButton(.primaryInverted) {
                        print("Primary button tapped")
                    }
                Text("Link")
                    .rainbowButton(.linkInverted) {
                        print("Link button tapped")
                    }
                Text("Info")
                    .rainbowButton(.infoInverted) {
                        print("Info button tapped")
                    }
                Text("Success")
                    .rainbowButton(.successInverted) {
                        print("Success button tapped")
                    }
                Text("Warning")
                    .rainbowButton(.warningInverted, isLoading: $isLoading) {
                        print("Warning button tapped")
                    }
                Text("Danger")
                    .rainbowButton(.dangerInverted) {
                        print("Danger button tapped")
                    }
            }
            #if os(tvOS)
            .padding()
            #endif
        }
    }
    
    /// Light button examples
    
    @ViewBuilder
    var lightButtonExamples: some View {
        header(text: "Light")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("Primary")
                    .rainbowButton(.primaryLight, .small) {
                        print("Primary button tapped")
                    }
                Text("Link")
                    .rainbowButton(.linkLight, .medium) {
                        print("Link button tapped")
                    }
                Text("Info")
                    .rainbowButton(.infoLight, .large) {
                        print("Info button tapped")
                    }
                Text("Success")
                    .rainbowButton(.successLight, .extraLarge) {
                        print("Success button tapped")
                    }
                Text("Warning")
                    .rainbowButton(.warningLight) {
                        print("Warning button tapped")
                    }
                Text("Danger")
                    .rainbowButton(.dangerLight, .jumbo) {
                        print("Danger button tapped")
                    }
            }
            #if os(tvOS)
            .padding()
            #endif
        }
    }
    
    /// Custom size examples
    
    @ViewBuilder
    var customSizeExamples: some View {
        header(text: "Sizes")
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Text("Small")
                    .rainbowButton(.defaultButton(.small)) {
                        print("Primary button tapped")
                    }
                Text("Default")
                    .rainbowButton(.default) {
                        print("Link button tapped")
                    }
                Text("Normal")
                    .rainbowButton(.defaultButton(.normal)) {
                        print("Normal button tapped")
                    }
                Text("Medium")
                    .rainbowButton(.defaultButton(.medium)) {
                        print("Medium button tapped")
                    }
                Text("Large")
                    .rainbowButton(.defaultButton(.large)) {
                        print("Large button tapped")
                    }
                Text("Extra Large")
                    .rainbowButton(.defaultButton(.extraLarge)) {
                        print("Extra Large button tapped")
                    }
                Text("Jumbo")
                    .rainbowButton(.defaultButton(.jumbo)) {
                        print("Jumbo button tapped")
                    }
            }
            #if os(tvOS)
            .padding()
            #endif
        }
    }
}

