//
//  ExampleNotificationModifiersView.swift
//  RainbowExamples
//
//  Created by Adam Dahan on 2024-07-07.
//

import SwiftUI
import Rainbow

struct ExampleNotificationsWithModifiersView: View {
    
    @State private var isPresented = false

    let notificationText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit lorem ipsum dolor. Pellentesque risus mi, tempus quis placerat ut, porta nec nulla. Vestibulum rhoncus ac ex sit amet fringilla."
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Text(notificationText)
                    .rainbowNotification(
                        configuration: .outlineWarning,
                        isPresented: $isPresented
                    ) {
                        print("Closed")
                    }
                Spacer()
                RainbowNotification(configuration: .link, isPresented: $isPresented) {
                    VStack {
                        Image(systemName: "heart")
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 100, height: 100)
                        Spacer()
                        Text(notificationText)
                    }
                }
                Spacer()
                RainbowNotification(configuration: .danger, isPresented: .constant(true), text: notificationText, showCloseButton: false)
            }
            .padding()
        }
        .onAppear {
            isPresented = true
        }
    }
}
