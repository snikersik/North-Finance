import SwiftUI

struct AppShellView: View {
    @State private var selection: AppSection? = .overview

    var body: some View {
        NavigationSplitView {
            List(AppSection.allCases, selection: $selection) { section in
                NavigationLink(value: section) {
                    Label {
                        Text(section.title)
                    } icon: {
                        Image(systemName: section.systemImage)
                    }
                }
                .accessibilityIdentifier("sidebar.\(section.rawValue)")
            }
            .navigationTitle("North Finance")
            .navigationSplitViewColumnWidth(min: 210, ideal: 240)
        } detail: {
            destination(for: selection ?? .overview)
        }
        .frame(minWidth: 900, minHeight: 600)
    }

    @ViewBuilder
    private func destination(for section: AppSection) -> some View {
        switch section {
        case .overview:
            OverviewView()
        case .transactions:
            TransactionsView()
        case .budgets:
            BudgetsView()
        case .goals:
            GoalsView()
        case .assets:
            AssetsView()
        case .settings:
            SettingsView()
        }
    }
}

struct AppShellView_Previews: PreviewProvider {
    static var previews: some View {
        AppShellView()
    }
}
