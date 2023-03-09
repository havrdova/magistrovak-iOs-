import ComposableArchitecture
import Models
import SwiftUI

// MARK: - News View

public struct NewsView: View {
    let store: StoreOf<NewsFeature>

    public init(store: StoreOf<NewsFeature>) {
        self.store = store
    }

    // MARK: Body

    public var body: some View {
        WithViewStore(store) { viewStore in
            List {
                ForEach(viewStore.allNews) { news in
                    newsCell(news)
                }
            }
            .task {
                await viewStore.send(.fetchProgram).finish()
            }
        }
    }

    // MARK: Cell View

    func newsCell(_ news: News) -> some View {
        VStack(alignment: .leading) {
            Text(news.name)
            Text(news.time)
        }
    }
}

// MARK: - News Preview

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView(
            store: Store(
                initialState: NewsFeature.State(),
                reducer: NewsFeature()
            )
        )
    }
}
