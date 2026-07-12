import SwiftUI

struct OverviewView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: NorthSpacing.spacious) {
                Text("Overview")
                    .font(NorthTypography.pageTitle)
                    .foregroundStyle(NorthColor.primaryText)

                LazyVGrid(
                    columns: [
                        GridItem(
                            .adaptive(minimum: NorthLayout.summaryCardMinimumWidth),
                            spacing: NorthSpacing.regular
                        )
                    ],
                    spacing: NorthSpacing.regular
                ) {
                    overviewCard(title: "Income")
                    overviewCard(title: "Expenses")
                    overviewCard(title: "Available")
                }
            }
            .frame(maxWidth: NorthLayout.contentMaximumWidth, alignment: .leading)
            .padding(NorthSpacing.spacious)
        }
        .background(NorthColor.background)
        .navigationTitle("Overview")
    }

    private func overviewCard(title: LocalizedStringResource) -> some View {
        SummaryCard(title) {
            Text("—")
                .financialAmountStyle()
                .foregroundStyle(NorthColor.primaryText)
                .accessibilityLabel("No value")
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
            .preferredColorScheme(.light)
            .previewDisplayName("Light")

        OverviewView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark")

        OverviewView()
            .environment(\.dynamicTypeSize, .accessibility2)
            .previewDisplayName("Accessibility Text")
    }
}
