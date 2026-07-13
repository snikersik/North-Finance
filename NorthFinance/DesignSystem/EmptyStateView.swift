import SwiftUI

struct EmptyStateView: View {
    private struct PrimaryAction {
        let title: LocalizedStringResource
        let perform: () -> Void
    }

    let title: LocalizedStringResource
    let message: LocalizedStringResource
    let systemImage: String
    private let primaryAction: PrimaryAction?

    init(
        title: LocalizedStringResource = "No data yet",
        message: LocalizedStringResource = "Items you add will appear here.",
        systemImage: String = "tray"
    ) {
        self.title = title
        self.message = message
        self.systemImage = systemImage
        primaryAction = nil
    }

    init(
        title: LocalizedStringResource = "No data yet",
        message: LocalizedStringResource = "Items you add will appear here.",
        systemImage: String = "tray",
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
                    .foregroundStyle(NorthColor.secondaryText)
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

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
            .environment(\.locale, Locale(identifier: "en"))
            .preferredColorScheme(.light)
            .previewDisplayName("English Light")

        EmptyStateView()
            .environment(\.locale, Locale(identifier: "pl"))
            .preferredColorScheme(.dark)
            .previewDisplayName("Polish Dark")
    }
}
