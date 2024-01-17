import SwiftUI

struct CreedsView: View {
    var body: some View {
//        VStack {
//            ForEach(AllCreeds.allCCreeds, id: \.self) { confession in
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
        Text("Creeds")
    }
}

struct CreedsView_Previews: PreviewProvider {
    static var previews: some View {
        CreedsView()
    }
}
