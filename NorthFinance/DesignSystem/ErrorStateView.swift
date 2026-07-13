import SwiftUI

struct ErrorStateView: View {
    private struct RetryAction {
        let title: LocalizedStringResource
        let perform: () -> Void
    }

    let title: LocalizedStringResource
    let message: LocalizedStringResource
    let systemImage: String
    private let retryAction: RetryAction?

    init(
        title: LocalizedStringResource = "Something went wrong",
        message: LocalizedStringResource = "Your saved data has not been changed.",
        systemImage: String = "exclamationmark.triangle"
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        retryAction = nil
    }

    init(
        title: LocalizedStringResource = "Something went wrong",
        message: LocalizedStringResource = "Your saved data has not been changed.",
        systemImage: String = "exclamationmark.triangle",
        retryTitle: LocalizedStringResource = "Try Again",
        retry: @escaping () -> Void
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        retryAction = RetryAction(title: retryTitle, perform: retry)
    }

    var body: some View {
        ContentUnavailableView {
            Label {
                Text(title)
                    .font(NorthTypography.cardTitle)
                    .foregroundStyle(NorthColor.primaryText)
            } icon: {
                Image(systemName: systemImage)
                    .foregroundStyle(NorthColor.destructive)
            }
        } description: {
            Text(message)
                .font(NorthTypography.body)
                .foregroundStyle(NorthColor.secondaryText)
        } actions: {
            if let retryAction {
                Button {
                    retryAction.perform()
                } label: {
                    Text(retryAction.title)
                }
                .buttonStyle(.borderedProminent)
                .tint(NorthColor.accent)
                .keyboardShortcut(.defaultAction)
            }
        }
        .applicationStateLayout()
    }
}

struct ErrorStateView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorStateView(retry: {})
            .environment(\.locale, Locale(identifier: "en"))
            .preferredColorScheme(.light)
            .previewDisplayName("English Light")

        ErrorStateView(retry: {})
            .environment(\.locale, Locale(identifier: "pl"))
            .preferredColorScheme(.dark)
            .environment(\.dynamicTypeSize, .accessibility3)
            .previewDisplayName("Polish Dark Accessibility Text")
    }
}
