import SwiftUI

struct FirstRunStateView: View {
    private struct PrimaryAction {
        let title: LocalizedStringResource
        let perform: () -> Void
    }

    let title: LocalizedStringResource
    let message: LocalizedStringResource
    let systemImage: String
    private let primaryAction: PrimaryAction?

    init(
        title: LocalizedStringResource = "Welcome to North Finance",
        message: LocalizedStringResource = "Start by adding your first item.",
        systemImage: String = "sparkles"
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        primaryAction = nil
    }

    init(
        title: LocalizedStringResource = "Welcome to North Finance",
        message: LocalizedStringResource = "Start by adding your first item.",
        systemImage: String = "sparkles",
        primaryActionTitle: LocalizedStringResource,
        primaryAction: @escaping () -> Void
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        self.primaryAction = PrimaryAction(
            title: primaryActionTitle,
            perform: primaryAction
        )
    }

    var body: some View {
        ContentUnavailableView {
            Label {
                Text(title)
                    .font(NorthTypography.cardTitle)
                    .foregroundStyle(NorthColor.primaryText)
            } icon: {
                Image(systemName: systemImage)
                    .foregroundStyle(NorthColor.accent)
            }
        } description: {
            Text(message)
                .font(NorthTypography.body)
                .foregroundStyle(NorthColor.secondaryText)
        } actions: {
            if let primaryAction {
                Button {
                    primaryAction.perform()
                } label: {
                    Text(primaryAction.title)
                }
                .buttonStyle(.borderedProminent)
                .tint(NorthColor.accent)
            }
        }
        .applicationStateLayout()
    }
}

struct FirstRunStateView_Previews: PreviewProvider {
    static var previews: some View {
        FirstRunStateView()
            .environment(\.locale, Locale(identifier: "pl"))
            .preferredColorScheme(.light)
            .previewDisplayName("Polish Light")

        FirstRunStateView()
            .environment(\.locale, Locale(identifier: "en"))
            .environment(\.dynamicTypeSize, .accessibility3)
            .previewDisplayName("English Accessibility Text")
    }
}
