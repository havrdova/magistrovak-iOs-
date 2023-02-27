import Foundation
import Models

// MARK: - All News DTO Model

struct AllNewsDTO: Codable {
    let news: [NewsDTO]
}

// MARK: News

struct NewsDTO: Codable {
    let id, cas, nazev: String
}

// MARK: - To Model Conversion

extension AllNewsDTO: DTOModelProtocol {
    var toModel: [News] {
        // TODO: implement
        var result: [News] = []

        self.news.forEach { news in
            result.append(News(id: news.id, name: news.nazev, time: news.cas))
        }

        return result
    }
}
