import SwiftUI

private enum HomeDestination: Hashable {
    case confessions, catechisms, creeds, about
}

@ViewBuilder
private func homeMenuMain(geometry: GeometryProxy, onSelect: @escaping (String) -> Void) -> some View {
    let buttonLabels = ["CONFESSIONS", "CATECHISMS", "CREEDS", "ABOUT/CONTACT"]
    VStack {
        Spacer()
        VStack(spacing: 20) {
            ForEach(buttonLabels, id: \.self) { label in
                Button(action: { onSelect(label) }) {
                    Text(label)
                }
                .buttonStyle(CustomButtonStyle())
            }
        }
        .frame(width: geometry.size.width)
        Spacer()
    }
    .background(
        Image("reformedAppBg")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .ignoresSafeArea()
    )
    #if os(iOS)
    .navigationBarHidden(true)
    .navigationBarTitle("Home", displayMode: .inline)
    #endif
}

struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, macOS 13.0, *) {
            ContentViewNavigationStack()
        } else {
            ContentViewNavigationView()
        }
    }
}

@available(iOS 16.0, macOS 13.0, *)
private struct ContentViewNavigationStack: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geometry in
                homeMenuMain(geometry: geometry) { label in
                    switch label {
                    case "CONFESSIONS": path.append(HomeDestination.confessions)
                    case "CATECHISMS": path.append(HomeDestination.catechisms)
                    case "CREEDS": path.append(HomeDestination.creeds)
                    case "ABOUT/CONTACT": path.append(HomeDestination.about)
                    default: break
                    }
                }
            }
            .navigationDestination(for: HomeDestination.self) { destination in
                switch destination {
                case .confessions: ConfessionsView()
                case .catechisms: CatechismsView()
                case .creeds: CreedsView()
                case .about: AboutView()
                }
            }
        }
    }
}

private struct ContentViewNavigationView: View {
    @State private var isConfessionsActive = false
    @State private var isCatechismsActive = false
    @State private var isCreedsActive = false
    @State private var isAboutActive = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
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
                    homeMenuMain(geometry: geometry) { label in
                        switch label {
                        case "CONFESSIONS": isConfessionsActive = true
                        case "CATECHISMS": isCatechismsActive = true
                        case "CREEDS": isCreedsActive = true
                        case "ABOUT/CONTACT": isAboutActive = true
                        default: break
                        }
                    }
                }
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
