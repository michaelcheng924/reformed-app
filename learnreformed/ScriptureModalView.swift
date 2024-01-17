import SwiftUI

struct ScriptureModalView: View {
    @Binding var selectedScripture: String?
    @State private var response: Response?

    var body: some View {
        ScrollView {
            VStack {
                if let response = response {
                    ForEach(response.results) { result in
                        Text(result.scripture)
                            .font(.system(size: 22, weight: .bold))
                            .padding(.vertical, 8)

                        ForEach(result.results) { chapter in
                            Text("Chapter \(chapter.chapter)")
                                .font(.title3)

                            Text(chapter.verses.map { "\($0.verse) \($0.text)" }.joined(separator: " "))
                                .font(.body)
                        }
                    }
                }
            }
            .padding()
        }
    }

    // Function to make the POST request
    func postScriptureToAPI(selectedScripture: String) {
        // Define the URL for the API endpoint
        // if let url = URL(string: "https://rwnextapi.vercel.app/api/scriptures") {
        if let url = URL(string: "http://localhost:3002/api/scriptures") {
            // Create a URLRequest
            var request = URLRequest(url: url)

            // Set the HTTP method to POST
            request.httpMethod = "POST"

            // Create a dictionary for the payload
            let payload: [String: String] = ["scripture": selectedScripture]

            // Convert the payload to JSON data
            if let jsonData = try? JSONSerialization.data(withJSONObject: payload) {
                // Set the request's HTTPBody with the JSON data
                request.httpBody = jsonData

                // Set the request's Content-Type header to JSON
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                // Create a URLSession task to send the request
                let task = URLSession.shared.dataTask(with: request) { data, _, error in
                    if let error = error {
                        print("Error: \(error)")
                        return
                    }

                    if let data = data {
                        if let decodedResponse = decodeResponse(data) {
                            self.response = decodedResponse
                        }
                    }
                }

                // Start the URLSession task
                task.resume()
            }
        }
    }
}

struct Response: Codable, Sequence {
    let results: [Result]

    func makeIterator() -> IndexingIterator<[Result]> {
        return results.makeIterator()
    }
}

struct Result: Codable, Identifiable {
    let id = UUID()
    let scripture: String
    let results: [Chapter]
}

struct Chapter: Codable, Identifiable {
    let id = UUID()
    let chapter: Int
    let verses: [Verse]
}

struct Verse: Codable, Identifiable {
    let id = UUID()
    let verse: Int
    let text: String
}

func decodeResponse(_ data: Data) -> Response? {
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: data)
        return response
    } catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}

struct ScriptureModalView_Previews: PreviewProvider {
    @State static var selectedScripture: String? = "Sample Scripture" // Provide an initial value

    static var previews: some View {
        ScriptureModalView(selectedScripture: $selectedScripture)
    }
}
