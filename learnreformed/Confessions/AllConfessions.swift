struct AllConfessions: Codable {
    let confessions: [Confession]
}

struct Confession: Codable {
    let slug: String
    let title: String
}
