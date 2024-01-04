import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: Text("CONFESSIONS Screen"), label: {
                    Text("CONFESSIONS")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.5)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                })

                NavigationLink(destination: Text("CATECHISMS Screen"), label: {
                    Text("CATECHISMS")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.5)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                })

                NavigationLink(destination: Text("CREEDS Screen"), label: {
                    Text("CREEDS")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 250)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.5)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                })
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
