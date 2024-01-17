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

                var scriptureCounter = 1 // Initialize the counter before the ForEach loop

                let contentWithCounter = getChapterDetailContentWithCounter(chapterDetail: chapterDetail)

                let scripturesWithCounter = getScripturesListWithCounter(chapterDetail: chapterDetail)

                ForEach(contentWithCounter.indices, id: \.self) { index in
                    let section = contentWithCounter[index]
                    Text(section)
                        .padding()
                }
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

    private func getChapterDetailContentWithCounter(chapterDetail: Content) -> [String] {
        var scriptureCounter = 1 // Initialize the counter
        let contentWithScriptureCounter: [String] = chapterDetail.content.map { section in
            let sectionText = section.map { contentItem in
                var textWithScripture = contentItem.text // Initialize with the text

                if let scriptures = contentItem.scriptures, !scriptures.isEmpty {
                    // Append "[X]" to the text, where X is the incremented counter
                    textWithScripture += " [\(scriptureCounter)]"
                    scriptureCounter += 1 // Increment the counter
                }

                return textWithScripture
            }.joined(separator: " ") // Use a space as a separator to create a single paragraph

            return sectionText
        }

        return contentWithScriptureCounter
    }

    struct ScriptureWithCounter: Hashable {
        let counter: Int
        let scriptures: String
    }

    private func getScripturesListWithCounter(chapterDetail: Content) -> [ScriptureWithCounter] {
        var scriptureCounter = 1 // Initialize the counter
        var scripturesWithCounter: [ScriptureWithCounter] = []

        for section in chapterDetail.content {
            for contentItem in section {
                if let scriptures = contentItem.scriptures {
                    let scriptureWithCounter = ScriptureWithCounter(counter: scriptureCounter, scriptures: scriptures)
                    scripturesWithCounter.append(scriptureWithCounter)
                    scriptureCounter += 1
                }
            }
        }

        return scripturesWithCounter
    }
}

struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ConfessionsView()
    }
}
