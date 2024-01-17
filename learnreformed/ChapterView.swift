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
                
                if (currentChapterIndex > 0) {
                    let previousChapter = chaptersData[currentChapterIndex - 1]
                    
                    Button(action: {
                        currentChapterIndex -= 1
                    }) {
                        Image(systemName: "arrow.backward")
                        Text(previousChapter.title)
                    }
                }
                
                if (currentChapterIndex < chaptersData.count - 1) {
                    let nextChapter = chaptersData[currentChapterIndex + 1]
                    
                    Button(action: {
                        currentChapterIndex += 1
                    }) {
                        Text(nextChapter.title)
                        Image(systemName: "arrow.forward")
                    }
                }

                Text(chapterDetail.chapter == "Preface" ? "Preface) \(chapterDetail.title)" : "Chapter \(chapterDetail.chapter)) \(chapterDetail.title)")
                    .font(.title)
                    .padding()
                
                var scriptureCounter = 1 // Initialize the counter before the ForEach loop

                ForEach(chapterDetail.content, id: \.self) { section in
                    let sectionText = section.map { contentItem in
                        var textWithScripture = contentItem.text // Initialize with the text

                        if let scriptures = contentItem.scriptures, !scriptures.isEmpty {
                            // Append "[X]" to the text, where X is the incremented counter
                            textWithScripture += " [\(scriptureCounter)]"
                            scriptureCounter += 1 // Increment the counter
                        }
                        
                        return textWithScripture
                    }.joined(separator: " ") // Use a space as a separator to create a single paragraph
                    
                    Text(sectionText)
                        .padding()
                }

            }
        }
    }
}

struct ChapterView_Previews: PreviewProvider {
    static var previews: some View {
        ConfessionsView()
    }
}
