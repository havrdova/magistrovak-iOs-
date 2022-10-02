//import SwiftUI
//import Combine
//
//// MARK: - Async View
//
//struct AsyncView<Source: Loadable,
//                 ErrorView: View,
//                 LoadingView: View,
//                 Content: View>: View {
//
//    @ObservedObject var source: Source
//    var loadingView: () -> LoadingView
//    var errorView: (Error) -> ErrorView
//    var content: (Source.Output) -> Content
//
//    var body: some View {
//        switch source.state {
//        case .idle, .loading:
//            loadingView()
//        case .failed(let error):
//            errorView(error)
//        case .loaded(let output):
//            content(output)
//        }
//    }
//
//}
//
//// MARK: - Async View init
//
//typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>
//typealias DefaultErrorView = CustomErrorView
//
//extension AsyncView where LoadingView == DefaultProgressView, ErrorView == DefaultErrorView {
//
//    init(
//        source: Source,
//        @ViewBuilder content: @escaping (Source.Output) -> Content
//    ) {
//        self.init(source: source) {
//            ProgressView()
//        } errorView: { error in
//            CustomErrorView(title: error.localizedDescription)
//        } content: { output in
//            content(output)
//        }
//    }
//
//}


import SwiftUI
import Combine

// MARK: - Async View

struct AsyncView<ErrorView: View,
                    LoadedView: View,
                    LoadingView: View,
                    LoadedValue: Equatable>: View {
    let loadable: Loadable<LoadedValue, APIError>
    let loadingView: () -> LoadingView
    let errorView: (APIError) -> ErrorView
    var loadedView: (LoadedValue) -> LoadedView

    var body: some View {
        switch loadable {
        case .idle, .loading:
            loadingView()

        case .failed(let error):
            errorView(error)

        case .loaded(let loadedData):
            loadedView(loadedData)
        }
    }

}

typealias DefaultProgressView = ProgressView<EmptyView, EmptyView>
typealias DefaultErrorView = CustomErrorView

extension AsyncView where LoadingView == DefaultProgressView, ErrorView == DefaultErrorView {
    init(
        for loadable: Loadable<LoadedValue, APIError>,
        @ViewBuilder loadedView: @escaping (LoadedValue) -> LoadedView
    ) {
        self.init(loadable: loadable) {
            ProgressView()
        } errorView: { error in
            CustomErrorView(title: error.localizedDescription)
        } loadedView: { loadedData in
            loadedView(loadedData)
        }
    }
}
