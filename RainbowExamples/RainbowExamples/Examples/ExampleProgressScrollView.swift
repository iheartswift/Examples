import SwiftUI
import Rainbow

struct ExampleProgressScrollView: View {
    
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 0) {
            
            RainbowProgressBar(.configure(.rainbow, .rectangle), $progress)
                .frame(height: 20)
            
            RainbowScrollProgressView(progress: $progress) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(0..<10) { chapter in
                        Text("Chapter \(chapter + 1)")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                        
                        ForEach(0..<5) { paragraph in
                            Text(dummyText)
                                .font(.body)
                                .padding(.bottom, 15)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Progress ScrollView")
    }
}

let dummyText = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ut urna ac nunc ultrices mollis. Fusce dictum, felis eu luctus dignissim, nulla magna posuere nisl, id luctus nunc lorem a odio. Quisque sit amet ultricies lorem. Integer sit amet ante justo. Phasellus venenatis, massa ut congue tincidunt, lacus libero lacinia leo, sed egestas massa justo ut libero. Morbi gravida odio nec ex convallis, sit amet vestibulum sapien dictum. Donec ut sagittis arcu, id ultricies risus. Aliquam erat volutpat.
"""

struct ExampleProgressScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleProgressScrollView()
    }
}
