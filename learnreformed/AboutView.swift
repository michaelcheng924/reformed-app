import SwiftUI

struct AboutView: View {
    var body: some View {
//        VStack {
//            ForEach(AllAbout.allCAbout, id: \.self) { confession in
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
        Text("About")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
