import SwiftUI

struct CreedsView: View {
    let allCreeds: [CreedNav]
    @State private var selectedCreedIndex = 0
    @State private var creedDetail: Creed?

    init() {
        if let loadedData = loadAllCreedsJSONFromFile(named: "allCreeds") {
            allCreeds = loadedData.creeds
        } else {
            allCreeds = []
        }
    }

    var body: some View {
        VStack {
            Picker("Select Creed", selection: $selectedCreedIndex) {
                ForEach(0 ..< allCreeds.count, id: \.self) { index in
                    Text(allCreeds[index].title)
                        .tag(index)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .onChange(of: selectedCreedIndex) { newIndex in
                // Handle the new index selection here
                // You can update creedDetail or perform any other actions
                loadCreedDetail(index: newIndex)
            }

            if let creedDetail = creedDetail {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(creedDetail.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 8)

                        ForEach(creedDetail.content, id: \.self) { contentItem in
                            ForEach(contentItem.paragraph, id: \.self) { paragraphItem in
                                if let styles = paragraphItem.styles, styles.contains("indent") {
                                    Text(paragraphItem.text)
                                        .font(.body)
                                        .padding(.leading, 32)
                                } else {
                                    Text(paragraphItem.text)
                                        .font(.body)
                                }
                            }
                            .padding(.bottom, 16)
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            loadCreedDetail(index: selectedCreedIndex)
        }
    }

    private func loadCreedDetail(index: Int) {
        if index < allCreeds.count {
            let slug = allCreeds[index].slug
            if let creedDetailData = loadCreedJSONFromFile(named: slug) {
                creedDetail = creedDetailData
            }
        }
    }
}

struct CreedsView_Previews: PreviewProvider {
    static var previews: some View {
        CreedsView()
    }
}

func loadAllCreedsJSONFromFile(named filename: String) -> AllCreeds? {
    do {
        if let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json"),
           let jsonData = try? Data(contentsOf: jsonURL)
        {
            let allCreeds = try JSONDecoder().decode(AllCreeds.self, from: jsonData)
            return allCreeds
        } else {
            print("Error loading JSON data from file")
        }
    } catch {
        print("Error decoding JSON:", error)
    }
    return nil
}

func loadCreedJSONFromFile(named filename: String) -> Creed? {
    do {
        if let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json"),
           let jsonData = try? Data(contentsOf: jsonURL)
        {
            let creedDetail = try JSONDecoder().decode(Creed.self, from: jsonData)
            return creedDetail
        } else {
            print("Error loading JSON data from file")
        }
    } catch {
        print("Error decoding JSON Creed:", error)
    }
    return nil
}
