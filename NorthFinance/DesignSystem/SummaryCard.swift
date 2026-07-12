import SwiftUI

struct SummaryCard<Content: View>: View {
    let title: LocalizedStringResource
    private let content: Content

    init(
        _ title: LocalizedStringResource,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: NorthSpacing.regular) {
            Text(title)
                .font(NorthTypography.cardTitle)
                .foregroundStyle(NorthColor.secondaryText)

            content
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(NorthSpacing.spacious)
        .background {
            RoundedRectangle(cornerRadius: NorthRadius.card, style: .continuous)
                .fill(NorthColor.surface)
        }
        .overlay {
            RoundedRectangle(cornerRadius: NorthRadius.card, style: .continuous)
                .stroke(NorthColor.separator)
        }
        .accessibilityElement(children: .contain)
    }
}
