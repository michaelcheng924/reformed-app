import SwiftUI

struct CatechismsView: View {
    var body: some View {
//        VStack {
//            ForEach(AllConfessions.allCconfessions, id: \.self) { confession in
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
        Text("CATECHISMS")
    }
}

struct CatechismsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfessionsView()
    }
}
