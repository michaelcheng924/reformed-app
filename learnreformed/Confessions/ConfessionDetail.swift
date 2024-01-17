struct ConfessionDetail: Codable {
    let slug: String
    let title: String
    let date: String
    let about: [String]
    let content: [Content]
}

struct Content: Codable {
    let chapter: String
    let title: String
    let topic: [String]? // Added to represent topics if available
    let content: [[TextContent]]
}

struct TextContent: Codable, Hashable {
    let superscript: Int? // Added to represent superscripts if available
    let text: String
    let scriptures: String? // Added to represent scriptures if available
}
