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
    
    var topConfig: ToastViewConfiguration {
        
        return ToastViewConfigurationBuilder()
            
            // Modify the configuration here
        
            /// Set the font
            .setFontOptions(ToastViewFontOptions(font: UIFont.boldSystemFont(ofSize: 24.0)))
        
            /// Set the corner radius of the toast
            .setCornerRadius(20.0)
        
            /// Add animation for slide in / out
            .setAnimationOptions(ToastViewAnimationOptions(duration: 0.5))
            
            /// Add rainbow
            .setRotatingBorderOptions(ToastViewRotatingBorderOptions(colors: [.systemGreen, .systemBlue, .systemMint, .systemPurple]))
            
            /// Add an image from a URL
            .setImageOptions(ToastViewImageOptions(
                url: URL(string: "https://www.minecraft.net/content/dam/games/minecraft/key-art/Vanilla-PMP_Collection-Carousel-0_Buzzy-Bees_1280x768.jpg")!
            ))
            
            .build()
    }
    
    var bottomConfig: ToastViewConfiguration {
        
        return ToastViewConfigurationBuilder()
            
            // Modify the configuration here
            .setPosition(.bottom)
        
            /// Set the font
            .setFontOptions(ToastViewFontOptions(font: UIFont.boldSystemFont(ofSize: 24.0)))
        
            /// Set the corner radius of the toast
            .setCornerRadius(20.0)
        
            /// Add animation for slide in / out
            .setAnimationOptions(ToastViewAnimationOptions(duration: 0.5))
            
            /// Add rainbow
            .setRotatingBorderOptions(ToastViewRotatingBorderOptions(colors: [.systemPurple, .systemOrange, .systemPink, .white]))
            
            /// Add an image from a URL
            .setImageOptions(ToastViewImageOptions(
                url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Instagram_logo_2022.svg/1200px-Instagram_logo_2022.svg.png")!
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
            text: "Download Minecraft",
            configuration: topConfig,
            show: $isShowingToast
        )
        .toast(
            text: "Your photos are ready",
            configuration: bottomConfig,
            show: $isShowingToast
        )
    }
}

#Preview {
    ContentView()
}
