struct AllCreeds: Codable {
    let creeds: [CreedNav]
}

struct CreedNav: Codable {
    let slug: String
    let title: String
}
