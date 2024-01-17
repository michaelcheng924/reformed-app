import SwiftUI

struct ConfessionsView: View {
    let allConfessions: [Confession]
    @State private var selectedConfessionIndex = 0
    @State private var confessionDetail: ConfessionDetail?
    
    init() {
        if let loadedData = loadJSONFromFile(named: "allConfessions") {
            self.allConfessions = loadedData.confessions
        } else {
            self.allConfessions = []
        }
    }
    
    var body: some View {
        VStack {
            Picker("Select Confession", selection: $selectedConfessionIndex) {
                ForEach(0..<allConfessions.count, id: \.self) { index in
                    Text(allConfessions[index].title)
                        .tag(index)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .onChange(of: selectedConfessionIndex) { newIndex in
                // Handle the new index selection here
                // You can update confessionDetail or perform any other actions
                loadConfessionDetail(index: newIndex)
            }
            
            if selectedConfessionIndex < allConfessions.count {
                
                if let detail = confessionDetail {
                    List(0..<detail.content.count, id: \.self) { index in
                        let chapter = detail.content[index]
                        
                        NavigationLink(destination: ChapterView(chapterDetail: detail.content[index])) {
                            Text(chapter.chapter == "Preface" ? "Preface) \(chapter.title)" : "Chapter \(chapter.chapter)) \(chapter.title)")
                        }
//                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitle("Confessions", displayMode: .inline)
                    }
                } else {
                    Text("Confession Detail Not Available")
                }
                
            }
        }
        .onAppear {
            loadConfessionDetail(index: selectedConfessionIndex)
        }
//        .navigationBarHidden(true)
    }
    
    private func loadConfessionDetail(index: Int) {
        if index < allConfessions.count {
            let slug = allConfessions[index].slug
            if let confessionDetailData = loadConfessionJSONFromFile(named: slug) {
                self.confessionDetail = confessionDetailData
            }
        }
    }
}

struct ConfessionsView_Previews: PreviewProvider {
    static var previews: some View {
        ConfessionsView()
    }
}

func loadJSONFromFile(named filename: String) -> AllConfessions? {
    do {
        if let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json"),
           let jsonData = try? Data(contentsOf: jsonURL) {
            let allConfessions = try JSONDecoder().decode(AllConfessions.self, from: jsonData)
            return allConfessions
        } else {
            print("Error loading JSON data from file")
        }
    } catch {
        print("Error decoding JSON:", error)
    }
    return nil
}

func loadConfessionJSONFromFile(named filename: String) -> ConfessionDetail? {
    do {
        if let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json"),
           let jsonData = try? Data(contentsOf: jsonURL) {
            let confessionDetail = try JSONDecoder().decode(ConfessionDetail.self, from: jsonData)
            return confessionDetail
        } else {
            print("Error loading JSON data from file")
        }
    } catch {
        print("Error decoding JSON:", error)
    }
    return nil
}
