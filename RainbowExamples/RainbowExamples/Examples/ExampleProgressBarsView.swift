import SwiftUI
import Rainbow

struct ExampleProgressBarsView: View {
    @State private var progress: Double = 0.5
    private let shapeType: RainbowShapeType = .capsule // or .rectangle, .roundedRectangle, etc.
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 40) {
                ForEach(ProgressBarType.allCases, id: \.self) { type in
                    RainbowProgressBar(type.configuration(shapeType), $progress)
                        .frame(height: type == .custom ? 40.0 : 20.0)
                }
            }
            .padding([.leading, .trailing, .bottom])
        }
    }
}

enum ProgressBarType: CaseIterable {
    
    case primary, link, info, success, warning, danger, rainbow, custom
    
    func configuration(_ shapeType: RainbowShapeType) -> RainbowProgressBarConfiguration {
        switch self {
        case .primary:
            return .configure(.primary, shapeType)
        case .link:
            return .configure(.link, shapeType)
        case .info:
            return .configure(.info, shapeType)
        case .success:
            return .configure(.success, shapeType)
        case .warning:
            return .configure(.warning, shapeType)
        case .danger:
            return .configure(.danger, shapeType)
        case .rainbow:
            return .configure(.rainbow, shapeType)
        case .custom:
            return customRainbowProgressBarConfigurationWithBorderAnimation
        }
    }
    
    var customRainbowProgressBarConfigurationWithBorderAnimation: RainbowProgressBarConfiguration {
        return RainbowProgressBarConfiguration.Builder()
            .setAnimation(.easeIn(duration: 0.2))
            .setBorder(RainbowBorderOptions(colors: RainbowDefaults.colors, width: 5.0, animationOptions: RainbowBorderAnimationOptions(interval: 0.3)))
            .setTheme(.rainbow)
            .setShape(.capsule)
            .build()
    }
}

#Preview {
    ExampleProgressBarsView()
}
