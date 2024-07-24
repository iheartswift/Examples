//
//  ExampleFieldsView.swift
//  RainbowExamples
//
//  Created by Adam Dahan on 2024-07-23.
//

import SwiftUI
import Rainbow

struct ExampleFieldsView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                RainbowField(
                    viewModel: RainbowFieldViewModel(
                        configuration: ExampleFieldsView.email
                    )
                )
                RainbowField(
                    viewModel: RainbowFieldViewModel(
                        configuration: RainbowFieldConfiguration.Builder()
                            .setHeaderOptions(.init(text: "Default"))
                            .build()
                    )
                )
                RainbowField(
                    viewModel: RainbowFieldViewModel(
                        configuration: RainbowFieldConfiguration.Builder()
                            .setHeaderOptions(.init(text: "Image left"))
                            .setIconOptions(.init(leftImageSystemName: "phone"))
                            .setPlaceholderTextOptions(.init(text: "Enter Phone"))
                            .build()
                    )
                )
                RainbowField(
                    viewModel: RainbowFieldViewModel(
                        configuration: RainbowFieldConfiguration.Builder()
                            .setHeaderOptions(.init(text: "Image Right"))
                            .setIconOptions(.init(rightImageSystemName: "phone"))
                            .setPlaceholderTextOptions(.init(text: "Enter Phone"))
                            .build()
                    )
                )
                RainbowField(
                    viewModel: RainbowFieldViewModel(
                        configuration: RainbowFieldConfiguration.Builder()
                            .setHeaderOptions(.init(text: "Image Left + Right"))
                            .setIconOptions(.init(leftImageSystemName: "person.circle.fill", rightImageSystemName: "phone"))
                            .setPlaceholderTextOptions(.init(text: "Enter Phone"))
                            .build()
                    )
                )
                RainbowField(
                    viewModel: RainbowFieldViewModel(
                        configuration: RainbowFieldConfiguration.Builder()
                            .setHeaderOptions(.init(text: "Custom Formatter + @FocusState"))
                            .setTextOptions(.init(formatter: RainbowPhoneNumberFormatter()))
                            .setIconOptions(.init(leftImageSystemName: "phone"))
                            .setPlaceholderTextOptions(.init(text: "Enter Phone"))
                            .setIdleStateAppearance(.init(captionText: "Try a phone number like 1.123.222.2222", captionColor: .gray))
                            .setFocusStateAppearance(.init(borderColor: .blue, leftImageTintColor: .blue, captionText: "e.g 1.123.222.2222", captionColor: .blue))
                            .build()
                    )
                )
                RainbowField(
                    viewModel: RainbowFieldViewModel(
                        configuration: RainbowFieldConfiguration.Builder()
                            .setFieldStyle(.cta)
                            .setCTAOptions(.init(text: "Tap to verify", action: {
                                print("Verify me")
                            }))
                            .setTextOptions(.init(formatter: RainbowPhoneNumberFormatter()))
                            .setIconOptions(.init(leftImageSystemName: "phone"))
                            .setPlaceholderTextOptions(.init(text: "Enter Phone"))
                            .setIdleStateAppearance(.init(borderColor: .yellow, leftImageTintColor: .yellow, captionText: "e.g 1.123.222.2222", captionColor: .yellow, buttonBackgroundColor: .yellow, buttonForegroundColor: .black))
                            .setFocusStateAppearance(.init(borderColor: .blue, leftImageTintColor: .blue, captionText: "e.g 1.123.222.2222", captionColor: .blue, buttonBackgroundColor: .blue, buttonForegroundColor: .white))
                            .build()
                    )
                )
            }
            .padding()
        }
    }
}

extension ExampleFieldsView {
    
    static var email: RainbowFieldConfiguration {
        
        let primaryBgColor = RainbowColorTheme.primary.background
        let primaryFgColor = RainbowColorTheme.primary.foreground
        
        return RainbowFieldConfiguration.Builder()
            .setFieldStyle(.cta)
            .setIconOptions(.init(
                leftImageSystemName: "person.crop.circle",
                rightImageSystemName: "checkmark",
                onlyShowRightImageIfNotFocused: true
            ))
            .setPlaceholderTextOptions(.init(text: "Enter Gmail", color: .gray))
            .setHeaderOptions(.init(
                text: "📧 Email",
                color: primaryFgColor
            ))
            .setCTAOptions(RainbowFieldCTAOptions(text: "@gmail.com", action: {
                print("Yo gmail")
            }))
            .setShapeType(.capsule)
            #if os(macOS)
            .setTextOptions(.init(isSecure: false, color: .blue))
            #else
            .setTextOptions(.init(isSecure: false, color: primaryFgColor, capitalization: .none, keyboardType: .emailAddress))
            #endif
            .setIdleStateAppearance(.init(
                borderColor: .gray,
                leftImageTintColor: .gray,
                rightImageTintColor: .gray,
                captionText: "e.g: adam@hacker.com",
                captionColor: .gray
            ))
            .setInvalidStateAppearance(.init(
                borderColor: RainbowColorTheme.danger.foreground,
                leftImageTintColor: RainbowColorTheme.danger.foreground,
                captionColor: RainbowColorTheme.danger.foreground,
                buttonBackgroundColor: RainbowColorTheme.danger.foreground,
                buttonForegroundColor: RainbowColorTheme.danger.background
            ))
            .setCursorOptions(.init(color: primaryBgColor)) // Only works on iOS
            .setFocusStateAppearance(.init(
                borderColor: primaryBgColor,
                leftImageTintColor: primaryBgColor,
                buttonBackgroundColor: primaryBgColor,
                buttonForegroundColor: primaryFgColor
            ))
            .setValidStateAppearance(.init(
                borderColor: .green,
                leftImageTintColor: .green,
                rightImageTintColor: .green,
                captionText: "Email is valid!",
                captionColor: .green,
                buttonBackgroundColor: .green,
                buttonForegroundColor: .black
            ))
            .setValidationRules([
                RainbowFieldValidationRule(message: "• Must contain no spaces", validate: { !$0.contains(" ") }),
                RainbowFieldValidationRule(message: "• Need at least 5 chars", validate: { $0.count > 4 }),
            ])
            .build()
    }
}

#Preview {
    ContentView()
}
