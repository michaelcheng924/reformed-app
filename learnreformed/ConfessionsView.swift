import SwiftUI

struct ConfessionsView: View {
//    let londonBaptist: LondonBaptist
//    
//    init() {
//        if let loadedData = loadJSONFromFile(named: "1689") {
//            print(loadedData)
//            self.londonBaptist = loadedData
//        } else {
//            print("HIHI")
//            self.londonBaptist = LondonBaptist(
//                slug: ""
//            )
//        }
//    }
    
    var body: some View {
        VStack {
            Text("CONFESSIONS")
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
        }
        .navigationTitle("Confessions")
    }
}

struct ConfessionsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfessionsView()
    }
}

func loadJSONFromFile(named filename: String) -> LondonBaptist? {
    if let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json"),
       let jsonData = try? Data(contentsOf: jsonURL),
       let londonBaptist = try? JSONDecoder().decode(LondonBaptist.self, from: jsonData) {
        return londonBaptist
    }
    return nil
}
