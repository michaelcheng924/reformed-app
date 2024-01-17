struct AllCatechisms: Codable {
    let catechisms: [Catechism]
}

struct Catechism: Codable {
    let slug: String
    let title: String
}
