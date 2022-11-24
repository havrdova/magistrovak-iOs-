import SwiftUI

// MARK: - Cell View

struct CellView: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack {
            Text(title)
            Text(subtitle)
        }
    }
}

// MARK: - Cell Preview

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(title: <#String#>, subtitle: <#String#>)
    }
}
