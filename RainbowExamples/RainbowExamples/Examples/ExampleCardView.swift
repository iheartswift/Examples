import SwiftUI
import Foundation
import Rainbow

struct ExampleCardView: View {
    
    var header: RainbowCardHeader {
        let configuration = RainbowCardHeaderConfiguration(buttonConfiguration: .default)
        let header = RainbowCardHeader(configuration: configuration, title: "Card Title", subtitle: "A basic card", buttonIcon: "heart", buttonAction: {
            print("I hate programming.")
        })
        return header
    }
    
    var media: RainbowCardMedia {
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.clear, .black]),
            startPoint: .top,
            endPoint: .bottom
        )

        let configuration = RainbowCardMediaConfiguration(
            url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!,
            shouldAutoPlay: true,
            gradientOverlay: gradient,
            title: "Skateboarding",
            subtitle: "California, Huntington Beach",
            textPosition: .bottomLeft
        )

        return RainbowCardMedia(configuration: configuration)
    }
    
    var footer: RainbowCardFooter {
        
        let buttons: [RainbowCardFooterConfiguration.RainbowButtonDescription] = [
            RainbowCardFooterConfiguration.RainbowButtonDescription(configuration: .outlined(.primary), action: { print("Primary button tapped") })
        ]

        let footerConfig = RainbowCardFooterConfiguration(
            buttons: buttons,
            alignment: .right
        )
        
        return RainbowCardFooter(configuration: footerConfig)
    }

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
        
            
            RainbowCard(headerContent: RainbowCardHeader(title: "Card title"))
                .padding()
            
            RainbowCard(headerContent: RainbowCardHeader(title: "Card title", subtitle: "Subtitle for the card"))
                .padding()
            
            RainbowCard(headerContent: RainbowCardHeader(title: "Card title", subtitle: "Subtitle for the card", buttonIcon: "heart", buttonAction: { print("Yay") }))
                .padding()
            
            RainbowCard(headerContent: RainbowCardHeader(title: "Card title", subtitle: "Subtitle for the card", buttonIcon: "heart", buttonTitle: "Heart", buttonAction: { print("Yay") }))
                .padding()
            
            RainbowCard(
                headerContent: RainbowCardHeader(title: "Card title", subtitle: "Subtitle for the card", buttonIcon: "heart", buttonTitle: "Heart", buttonAction: { print("Yay") }),
                mediaContent: RainbowCardMedia(configuration: RainbowCardMediaConfiguration(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!, shouldAutoPlay: true)),
                cardContent: RainbowCardContent(content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
            )
            .frame(height: 460)
            .padding()
            
            RainbowCard(
                mediaContent: SalesChartView(),
                cardContent: RainbowCardContent(content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
                footerContent: RainbowCardFooter(configuration: RainbowCardFooterConfiguration(buttons: [
                    RainbowCardFooterConfiguration.RainbowButtonDescription(configuration: .default, title: "Button", action: { print("Pressed info") }),
                    RainbowCardFooterConfiguration.RainbowButtonDescription(configuration: .default, title: "Test", action: { print("Pressed info") })
                ], alignment: .sides))
            )
            .padding()
            
            RainbowCard(
                mediaContent: media
            )
            .frame(height: 300)
            .padding()
            
            RainbowCard(
                mediaContent: media,
                footerContent: RainbowCardFooter(configuration: RainbowCardFooterConfiguration(buttons: [
                    RainbowCardFooterConfiguration.RainbowButtonDescription(configuration: .default, title: "Button 1",  action: { print("Pressed info") }),
                    RainbowCardFooterConfiguration.RainbowButtonDescription(configuration: .default, title: "Button 2", action: { print("Pressed info") })
                ], alignment: .sides))
            )
            .frame(height: 400)
            .padding()
            
            Spacer()
        }
    }
}
