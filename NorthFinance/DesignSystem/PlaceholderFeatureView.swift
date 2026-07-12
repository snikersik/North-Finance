import SwiftUI

struct PlaceholderFeatureView: View {
    let title: LocalizedStringResource
    let systemImage: String
    let message: LocalizedStringResource

    var body: some View {
        ContentUnavailableView {
            Label {
                Text(title)
            } icon: {
                Image(systemName: systemImage)
            }
        } description: {
            Text(message)
        }
        .navigationTitle(Text(title))
    }
}
