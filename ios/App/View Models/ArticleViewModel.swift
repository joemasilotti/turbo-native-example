import Combine
import Foundation

class ArticleViewModel: ObservableObject {
    @Published var title = ""
    @Published var body = ""

    private let path: String

    init(path: String) {
        self.path = path
    }

@MainActor
func fetchArticle() async {
    do {
        let url = rootURL.appending(path: path).appendingPathExtension("json")
        let (data, _) = try await URLSession.shared.data(from: url)
        let article = try JSONDecoder().decode(Article.self, from: data)
        title = article.title
        body = article.body
    } catch {
        print("Failed to fetch the article: \(error.localizedDescription)")
    }
}
}

struct Article: Decodable {
    let title: String
    let body: String
}
