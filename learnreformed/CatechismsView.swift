import SwiftUI

struct CatechismsView: View {
    let allCatechisms: [Catechism]
    @State private var selectedCatechismIndex = 0
    @State private var catechismDetail: CatechismDetail?
    @State private var chapterIndex = 0
    @State private var isShowingModal = false
    @State private var selectedScripture: String?

    init() {
        if let loadedData = loadAllCatechismsJSONFromFile(named: "allCatechisms") {
            allCatechisms = loadedData.catechisms
        } else {
            allCatechisms = []
        }
    }

    var body: some View {
        VStack {
            Picker("Select Confession", selection: $selectedCatechismIndex) {
                ForEach(0 ..< allCatechisms.count, id: \.self) { index in
                    Text(allCatechisms[index].title)
                        .tag(index)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .onChange(of: selectedCatechismIndex) { newIndex in
                // Handle the new index selection here
                // You can update catechismDetail or perform any other actions
                loadCatechismDetail(index: newIndex)
            }

            if selectedCatechismIndex < allCatechisms.count {
                if let detail = catechismDetail {
                    ScrollView {
                        VStack(alignment: .leading) {
                            ForEach(0 ..< detail.content.count, id: \.self) { index in
                                let question = detail.content[index]

                                Text("\(index + 1). \(question.question)")
                                    .font(.headline)
                                    .padding(.top, 8)

                                ForEach(0 ..< question.answer.count, id: \.self) { index in
                                    let answer = question.answer[index]

                                    Text(answer.text)
                                        .font(.body)
                                        .padding(.bottom, 8)

                                    if let scriptures = answer.scriptures {
                                        Button(action: {
                                            selectedScripture = scriptures
                                            isShowingModal = true
                                        }) {
                                            Text(scriptures)
                                                .padding(.vertical, 4)
                                                .foregroundColor(Color.blue)
                                        }
                                        .buttonStyle(.plain)
                                        .sheet(isPresented: $isShowingModal) {
                                            ScriptureModalView(selectedScripture: $selectedScripture)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                } else {
                    Text("Catechism Detail Not Available")
                }
            }
        }
        .onAppear {
            loadCatechismDetail(index: selectedCatechismIndex)
        }
//        .navigationBarHidden(true)
    }

    private func loadCatechismDetail(index: Int) {
        if index < allCatechisms.count {
            let slug = allCatechisms[index].slug
            if let catechismDetailData = loadCatechismJSONFromFile(named: slug) {
                catechismDetail = catechismDetailData
            }
        }
    }
}

struct CatechismssView_Previews: PreviewProvider {
    static var previews: some View {
        CatechismsView()
    }
}

func loadAllCatechismsJSONFromFile(named filename: String) -> AllCatechisms? {
    do {
        if let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json"),
           let jsonData = try? Data(contentsOf: jsonURL)
        {
            let allCatechisms = try JSONDecoder().decode(AllCatechisms.self, from: jsonData)
            return allCatechisms
        } else {
            print("Error loading JSON data from file")
        }
    } catch {
        print("Error decoding JSON:", error)
    }
    return nil
}

func loadCatechismJSONFromFile(named filename: String) -> CatechismDetail? {
    do {
        if let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json"),
           let jsonData = try? Data(contentsOf: jsonURL)
        {
            let catechismDetail = try JSONDecoder().decode(CatechismDetail.self, from: jsonData)
            return catechismDetail
        } else {
            print("Error loading JSON data from file")
        }
    } catch {
        print("Error decoding JSON:", error)
    }
    return nil
}
