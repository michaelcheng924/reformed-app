import SwiftUI

struct ChapterView: View {
    var chaptersData: [Content]
    var initialIndex: Int

    @State private var currentChapterIndex: Int // State variable to track the current chapter index

    init(chaptersData: [Content], initialIndex: Int) {
        self.chaptersData = chaptersData
        self.initialIndex = initialIndex
        _currentChapterIndex = State(initialValue: initialIndex) // Initialize the currentChapterIndex
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                let chapterDetail = chaptersData[currentChapterIndex]

                if currentChapterIndex > 0 {
                    let previousChapter = chaptersData[currentChapterIndex - 1]

                    HStack {
                        Button(action: {
                            currentChapterIndex -= 1
                        }) {
                            HStack {
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(Color.white)
                                Text(getTitle2(chapterDetail: previousChapter))
                                    .foregroundColor(Color.white)
                                    .onTapGesture {
                                        currentChapterIndex -= 1
                                    }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                        }
                        .background(Color.purple)
                        .cornerRadius(10)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                }

                if currentChapterIndex < chaptersData.count - 1 {
                    let nextChapter = chaptersData[currentChapterIndex + 1]

                    HStack {
                        Spacer()
                        Button(action: {
                            currentChapterIndex += 1
                        }) {
                            HStack {
                                Text(getTitle2(chapterDetail: nextChapter))
                                    .foregroundColor(Color.white)
                                Image(systemName: "arrow.forward")
                                    .foregroundColor(Color.white)
                                    .onTapGesture {
                                        currentChapterIndex += 1
                                    }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                        }
                        .background(Color.purple)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 20)
                }

                Text(getTitle(chapterDetail: chapterDetail))
                    .font(.title)
                    .padding()

                let contentWithCounter = getChapterDetailContentWithCounter(chapterDetail: chapterDetail)

                ForEach(contentWithCounter.indices, id: \.self) { index in
                    let section = contentWithCounter[index]

                    Text(section["sectionText"] as! String)
                        .padding()

                    if let sectionScripturesList = section["sectionScripturesList"] as? [ScriptureWithCounter] {
                        ForEach(sectionScripturesList.indices, id: \.self) { index in
                            let scripture = sectionScripturesList[index]

                            Text("\(scripture.counter)) \(scripture.scriptures)")
                                .padding()
                        }
                    }
                }

                // ForEach(contentWithCounter.indices, id: \.self) { index in
                //     let section = contentWithCounter[index]

                //     Text(section)
                //         .padding()
                // }
            }
        }
    }

    private func getTitle(chapterDetail: Content) -> String {
        if chapterDetail.chapter == "Preface" {
            return "Preface) \(chapterDetail.title)"
        } else {
            return "Chapter \(chapterDetail.chapter)) \(chapterDetail.title)"
        }
    }

    private func getTitle2(chapterDetail: Content) -> String {
        return "\(chapterDetail.chapter)) \(chapterDetail.title)"
    }

    // private func getChapterDetailContentWithCounter(chapterDetail: Content) -> [String] {
    //     var scriptureCounter = 1 // Initialize the counter
    //     let contentWithScriptureCounter: [String] = chapterDetail.content.map { section in
    //         let sectionText = section.map { contentItem in
    //             var textWithScripture = contentItem.text // Initialize with the text

    //             if let scriptures = contentItem.scriptures, !scriptures.isEmpty {
    //                 // Append "[X]" to the text, where X is the incremented counter
    //                 textWithScripture += " [\(scriptureCounter)]"
    //                 scriptureCounter += 1 // Increment the counter
    //             }

    //             return textWithScripture
    //         }.joined(separator: " ") // Use a space as a separator to create a single paragraph

    //         return sectionText
    //     }

    //     return contentWithScriptureCounter
    // }

    struct ScriptureWithCounter: Hashable {
        let counter: Int
        let scriptures: String
    }

    private func getChapterDetailContentWithCounter(chapterDetail: Content) -> [[String: Any]] {
        var scriptureCounter = 1
        var contentWithScriptureCounter: [[String: Any]] = []

        for section in chapterDetail.content {
            var sectionScripturesList: [ScriptureWithCounter] = []

            let sectionText = section.map { contentItem in
                var textWithScripture = contentItem.text

                if let scriptures = contentItem.scriptures, !scriptures.isEmpty {
                    sectionScripturesList.append(ScriptureWithCounter(counter: scriptureCounter, scriptures: scriptures))

                    textWithScripture += " [\(scriptureCounter)]"
                    scriptureCounter += 1
                }

                return textWithScripture
            }.joined(separator: " ")

            print("sectionScripturesList: \(sectionScripturesList)")
            let sectionData: [String: Any] = [
                "sectionText": sectionText,
                "sectionScripturesList": sectionScripturesList,
            ]

            contentWithScriptureCounter.append(sectionData)
        }

        return contentWithScriptureCounter
    }
}

struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ConfessionsView()
    }
}
