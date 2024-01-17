import SwiftUI

struct SettingsView: View {
    var body: some View {
//        VStack {
//            ForEach(AllSettings.allCSettings, id: \.self) { confession in
//                Button(action: {
//                    // Handle button tap here
//                    print("Button tapped")
//                }) {
//                    Text(confession.title)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                }
//                .padding(.vertical, 5)
//            }
//        }
        Text("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
