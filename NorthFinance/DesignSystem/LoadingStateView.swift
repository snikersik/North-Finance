import SwiftUI

struct LoadingStateView: View {
    let message: LocalizedStringResource?
    let accessibilityLabel: LocalizedStringResource

    init(
        message: LocalizedStringResource? = nil,
        accessibilityLabel: LocalizedStringResource = "Loading…"
    ) {
        self.message = message
        self.accessibilityLabel = accessibilityLabel
    }

    var body: some View {
        VStack(spacing: NorthSpacing.regular) {
            ProgressView()
                .controlSize(.large)
                .tint(NorthColor.accent)
                .accessibilityLabel(Text(accessibilityLabel))

            if let message {
                Text(message)
                    .font(NorthTypography.body)
                    .foregroundStyle(NorthColor.secondaryText)
                    .multilineTextAlignment(.center)
            }
        }
        .accessibilityElement(children: .contain)
        .applicationStateLayout()
    }
}

struct LoadingStateView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingStateView(message: "Loading…")
            .environment(\.locale, Locale(identifier: "en"))
            .preferredColorScheme(.dark)
            .previewDisplayName("English Dark")

        LoadingStateView(message: "Loading…")
            .environment(\.locale, Locale(identifier: "pl"))
            .environment(\.dynamicTypeSize, .accessibility3)
            .previewDisplayName("Polish Accessibility Text")
    }
}
