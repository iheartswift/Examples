import SwiftUI
import Rainbow

// MARK: - SwitchView

struct ExampleSwitchView: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        HStack {
            VStack(spacing: 20) {
                
                RainbowSwitch(configuration: .configure(theme: .primary), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .link), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .info), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .success), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .warning), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .danger), isOn: $isOn)
                
                RainbowSwitch(configuration: .configure(theme: .primaryLight), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .linkLight), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .infoLight), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .successLight), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .warningLight), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .dangerLight), isOn: $isOn)
            }
            VStack(spacing: 20) {
                
                RainbowSwitch(configuration: .configure(theme: .primaryInverted), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .linkInverted), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .infoInverted), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .successInverted), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .warningInverted), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .dangerInverted), isOn: $isOn)
                
                RainbowSwitch(configuration: .configure(theme: .outlinedPrimary), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .outlinedLink), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .outlinedInfo), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .outlinedSuccess), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .outlinedWarning), isOn: $isOn)
                RainbowSwitch(configuration: .configure(theme: .outlinedDanger), isOn: $isOn)
            }
        }
    }
}

