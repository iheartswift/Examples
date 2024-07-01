import SwiftUI

struct Component: Identifiable, Equatable, Hashable {
    var id = UUID()
    var title: String
    var destination: any View

    // Equatable conformance
    static func == (lhs: Component, rhs: Component) -> Bool {
        lhs.id == rhs.id
    }

    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct ContentSection: Identifiable {
    var id = UUID()
    let title: String
    let components: [Component]
}

struct ContentView: View {
    private let sections: [ContentSection] = [
        ContentSection(title: "", components: [
            Component(title: "Buttons", destination: ExampleButtonsView()),
            Component(title: "Progress Bars", destination: ExampleProgressBarsView()),
            Component(title: "Progress ScrollView", destination: ExampleProgressScrollView()),
            Component(title: "Card", destination: ExampleCardView()),
            Component(title: "Image", destination: ExampleImageView())
        ])
    ]
    
    @State private var selectedComponent: Component?
    
    var body: some View {
        #if os(macOS)
        NavigationSplitView {
            List(selection: $selectedComponent) {
                ForEach(sections) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.components) { component in
                            NavigationLink(value: component) {
                                Text(component.title)
                            }
                        }
                    }
                }
            }
            .applyListStyle()
            .navigationTitle("Components")
        } detail: {
            if let selectedComponent = selectedComponent {
                AnyView(selectedComponent.destination)
                    .navigationDestination(for: Component.self) { component in
                        AnyView(component.destination)
                    }
            } else {
                Text("Select a component")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
        #else
        NavigationStack {
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.components) { component in
                            NavigationLink(destination: AnyView(component.destination)) {
                                Text(component.title)
                            }
                        }
                    }
                }
            }
            .applyListStyle()
            .navigationTitle("Components")
        }
        #endif
    }
}

extension View {
    @ViewBuilder
    func applyListStyle() -> some View {
        #if os(iOS) || os(tvOS)
        self.listStyle(GroupedListStyle())
        #else
        self.listStyle(SidebarListStyle())
        #endif
    }
}

#Preview {
    ContentView()
}

