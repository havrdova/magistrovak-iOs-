import Foundation
import SwiftUI

// MARK: - Programme View

struct ProgrammeView: View {
    var viewModel: ProgrammeViewModel

    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

// MARK: ProgrammeView Preview

struct ProgrammeView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammeView(viewModel: ProgrammeViewModel())
    }
}
