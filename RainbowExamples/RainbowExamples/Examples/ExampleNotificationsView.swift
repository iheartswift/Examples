//
//  ExampleNotificationsView.swift
//  RainbowExamples
//
//  Created by Adam Dahan on 2024-07-07.
//

import SwiftUI
import Rainbow

struct ExampleNotificationsView: View {
    @State private var isPrimaryPresented = true
    @State private var isLinkPresented = true
    @State private var isInfoPresented = true
    @State private var isSuccessPresented = true
    @State private var isWarningPresented = true
    @State private var isDangerPresented = true
    @State private var isPrimaryLightPresented = true
    @State private var isLinkLightPresented = true
    @State private var isInfoLightPresented = true
    @State private var isSuccessLightPresented = true
    @State private var isWarningLightPresented = true
    @State private var isDangerLightPresented = true
    @State private var isOutlinePrimaryPresented = true
    @State private var isOutlineLinkPresented = true
    @State private var isOutlineInfoPresented = true
    @State private var isOutlineSuccessPresented = true
    @State private var isOutlineWarningPresented = true
    @State private var isOutlineDangerPresented = true

    let notificationText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor. Pellentesque risus mi, tempus quis placerat ut, porta nec nulla. Vestibulum rhoncus ac ex sit amet fringilla. Nullam gravida purus diam, et dictum felis venenatis efficitur."
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                RainbowNotification(configuration: .primary, isPresented: $isPrimaryPresented, text: "Primary " + notificationText)
                RainbowNotification(configuration: .link, isPresented: $isLinkPresented, text: "Link " + notificationText)
                RainbowNotification(configuration: .info, isPresented: $isInfoPresented, text: "Info " + notificationText)
                RainbowNotification(configuration: .success, isPresented: $isSuccessPresented, text: "Success " + notificationText)
                RainbowNotification(configuration: .warning, isPresented: $isWarningPresented, text: "Warning " + notificationText)
                RainbowNotification(configuration: .danger, isPresented: $isDangerPresented, text: "Danger " + notificationText)
                RainbowNotification(configuration: .primaryLight, isPresented: $isPrimaryLightPresented, text: "Primary Light " + notificationText)
                RainbowNotification(configuration: .linkLight, isPresented: $isLinkLightPresented, text: "Link Light " + notificationText)
                RainbowNotification(configuration: .infoLight, isPresented: $isInfoLightPresented, text: "Info Light " + notificationText)
                RainbowNotification(configuration: .successLight, isPresented: $isSuccessLightPresented, text: "Success Light " + notificationText)
                RainbowNotification(configuration: .warningLight, isPresented: $isWarningLightPresented, text: "Warning Light " + notificationText)
                RainbowNotification(configuration: .dangerLight, isPresented: $isDangerLightPresented, text: "Danger Light " + notificationText)
                RainbowNotification(configuration: .outlinePrimary, isPresented: $isOutlinePrimaryPresented, text: "Outline Primary " + notificationText)
                RainbowNotification(configuration: .outlineLink, isPresented: $isOutlineLinkPresented, text: "Outline Link " + notificationText)
                RainbowNotification(configuration: .outlineInfo, isPresented: $isOutlineInfoPresented, text: "Outline Info " + notificationText)
                RainbowNotification(configuration: .outlineSuccess, isPresented: $isOutlineSuccessPresented, text: "Outline Success " + notificationText)
                RainbowNotification(configuration: .outlineWarning, isPresented: $isOutlineWarningPresented, text: "Outline Warning " + notificationText)
                RainbowNotification(configuration: .outlineDanger, isPresented: $isOutlineDangerPresented, text: "Outline Danger " + notificationText)
            }
            .padding()
        }
    }
}
