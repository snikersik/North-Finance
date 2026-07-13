import SwiftUI

struct PlaceholderFeatureView: View {
    let title: LocalizedStringResource
    let systemImage: String
    let message: LocalizedStringResource

    var body: some View {
        EmptyStateView(
            title: title,
            message: message,
            systemImage: systemImage
        )
        .navigationTitle(Text(title))
    }
}
