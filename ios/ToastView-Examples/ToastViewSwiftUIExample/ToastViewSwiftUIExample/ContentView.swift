//
//  ContentView.swift
//  ToastViewSwiftUIExample
//
//  Created by Adam Dahan on 2024-06-09.
//

import SwiftUI
import ToastView

struct ContentView: View {
    
    @State var isShowingToast: Bool = false
    
    var config: ToastViewConfiguration {
        
        return ToastViewConfigurationBuilder()
            
            /// This is so the toast always displays in the preview otherwise it would disappear after the presentationOptions.delay
            .setPresentationOptions(ToastViewPresentationOptions(infinite: true))
            
            // Modify the configuration here
            .setCornerRadius(30.0)
        
            /// Add animation for slide in / out
            .setAnimationOptions(ToastViewAnimationOptions(duration: 0.5))
            
            /// Add rainbow
            .setRotatingBorderOptions(ToastViewRotatingBorderOptions())
            
            /// Add an image from a URL
            .setImageOptions(ToastViewImageOptions(
                url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/800px-Instagram_logo_2022.svg.png")!
            ))
            
            .build()
    }

    var body: some View {
        VStack {
            Button(action: {
                isShowingToast.toggle()
            }, label: {
                if isShowingToast {
                    Text("Hide toast")
                        .tint(.purple)
                } else {
                    Text("Show toast")
                        .tint(.blue)
                }
            })
        }
        .padding()
        .toast(
            text: "Testing",
            configuration: config,
            show: $isShowingToast
        )
    }
}

#Preview {
    ContentView()
}
