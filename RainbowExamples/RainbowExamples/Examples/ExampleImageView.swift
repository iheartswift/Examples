import SwiftUI
import Foundation
import Rainbow

struct ExampleImageView: View {
    
    private enum RainbowConfiguration {
        static var DiskRainbowImageConfiguration: RainbowImageConfiguration {
            
            let gradient = LinearGradient(
                gradient: Gradient(colors: [.clear, .black]),
                startPoint: .top,
                endPoint: .bottom
            )
            
            let configuration = Rainbow.RainbowImageConfiguration(source: .disk(name: "art"),
                                                                  gradientOverlay: gradient)
            
            return configuration
        }
        
        
        static let BorderGradient = LinearGradient(
            gradient: Gradient(colors: [Color(red: 0.87, green: 0.29, blue: 0.61),
                                        Color(red: 0.98, green: 0.42, blue: 0.41),
                                        Color(red: 0.99, green: 0.75, blue: 0.29)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static var RemoteRainbowImageConfiguration: RainbowImageConfiguration {
            let configuration = Rainbow.RainbowImageConfiguration(source: .url( URL(string: "https://stackoverflow.design/assets/img/logos/so/logo-stackoverflow.png")! ))
            
            return configuration
        }
        
        
        static var SFRainbowImageConfiguration: RainbowImageConfiguration {
            let configuration = Rainbow.RainbowImageConfiguration(source: .system(name: "globe"))
            
            return configuration
        }
        
    }
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                RainbowImage(configuration: RainbowConfiguration.SFRainbowImageConfiguration)
                    .frame(width:40, height: 40)
                    .padding()
                
                Spacer()
            }
            
            
            RainbowImage(configuration: RainbowConfiguration.DiskRainbowImageConfiguration)
                .frame(height: 300)
                .roundRect(cornerRadius: 10)
                .rainbowBorder(gradient: RainbowConfiguration.BorderGradient,
                               cornerRadius: 10,
                               lineWidth: 4)
            
                .padding()
            
            RainbowImage(configuration: RainbowConfiguration.RemoteRainbowImageConfiguration)
                .frame(height: 80)
                .padding()
            
            
            
            
            Spacer()
        }
    }
}

#Preview {
    ExampleImageView()
}

