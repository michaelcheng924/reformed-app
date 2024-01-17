// Define a struct that matches the structure of your JSON data
struct LondonBaptist: Codable {
    let slug: String
    let title: String
    let date: String
    let about: [String]
    let content: [Content]
}

struct Content: Codable {
    let chapter: String
    let title: String
    let content: [[TextContent]]
}

struct TextContent: Codable {
    let text: String
}
