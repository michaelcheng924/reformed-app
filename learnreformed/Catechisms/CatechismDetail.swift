struct CatechismDetail: Codable {
    let slug: String
    let title: String
    let content: [CatechismContent]
}

struct CatechismContent: Codable {
    let section: String?
    let number: Int
    let question: String
    let answer: [Answer]
}

struct Answer: Codable {
    let text: String
    let scriptures: String?
}
