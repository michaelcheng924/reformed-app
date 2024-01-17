import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hi! My name is Mike, and I re-wrote this app using native iOS Swift code. This was previously coded with React Native and became too old to update. If you see problems, please email me at reformedwikisite@gmail.com. Thanks!")
                    .font(.body)
                    .padding()
            }
            .navigationBarTitle("About", displayMode: .inline)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
