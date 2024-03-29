import SwiftUI

struct ContentView: View {
    @State private var isConfessionsActive = false
    @State private var isCatechismsActive = false
    @State private var isCreedsActive = false
    @State private var isAboutActive = false

    let buttonLabels = ["CONFESSIONS", "CATECHISMS", "CREEDS", "ABOUT/CONTACT"]

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        NavigationLink(destination: ConfessionsView(), isActive: $isConfessionsActive) {
                            EmptyView()
                        }

                        NavigationLink(destination: CatechismsView(), isActive: $isCatechismsActive) {
                            EmptyView()
                        }
                        NavigationLink(destination: CreedsView(), isActive: $isCreedsActive) {
                            EmptyView()
                        }
                        NavigationLink(destination: AboutView(), isActive: $isAboutActive) {
                            EmptyView()
                        }
                        ForEach(buttonLabels, id: \.self) { label in
                            Button(action: {
                                if label == "CONFESSIONS" {
                                    isConfessionsActive = true
                                } else if label == "CATECHISMS" {
                                    isCatechismsActive = true
                                } else if label == "CREEDS" {
                                    isCreedsActive = true
                                } else if label == "ABOUT/CONTACT" {
                                    isAboutActive = true
                                }
                                // Handle other buttons here if needed
                            }) {
                                Text(label)
                            }
                            .buttonStyle(CustomButtonStyle())
                        }
                    }
                    .frame(width: geometry.size.width)
                    Spacer()
                }
                .background(
                    Image("reformedAppBg") // Replace with your image name
                        .resizable()
                        .aspectRatio(contentMode: .fill) // Fill the entire screen while maintaining aspect ratio
                        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height) // Ensure the image's dimensions match the screen
                        .edgesIgnoringSafeArea(.all) // Ignore safe areas
                )
                .navigationBarHidden(true)
                .navigationBarTitle("Home", displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .font(.system(size: 24, weight: .bold))
            .frame(width: 250)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.blue.opacity(0.7)]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
    }
}
