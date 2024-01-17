struct Creed: Codable {
    let type: String
    let slug: String
    let title: String
    let subtitle: String
    let date: String
    let dateNum: Int
    let url: String
    let about: [String]
    let content: [CreedContent]
}

struct CreedContent: Codable, Hashable {
    let paragraph: [CreedParagraph]
}

struct CreedParagraph: Codable, Hashable {
    let text: String
    let styles: [String]?
}
