import SwiftUI

struct ChapterView: View {
    var chapterDetail: Content

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(chapterDetail.chapter == "Preface" ? "Preface) \(chapterDetail.title)" : "Chapter \(chapterDetail.chapter)) \(chapterDetail.title)")
                    .font(.title)
                    .padding()
                
                ForEach(chapterDetail.content, id: \.self) { section in
                    ForEach(section, id: \.self) { contentItem in
                        Text(contentItem.text)
                            .padding()
                    }
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
