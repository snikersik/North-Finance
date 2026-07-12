import SwiftUI

enum AppSection: String, CaseIterable, Identifiable {
    case overview
    case transactions
    case budgets
    case goals
    case assets
    case settings

    var id: String { rawValue }

    var title: LocalizedStringResource {
        switch self {
        case .overview: "Overview"
        case .transactions: "Transactions"
        case .budgets: "Budgets"
        case .goals: "Goals"
        case .assets: "Assets"
        case .settings: "Settings"
        }
    }

    var systemImage: String {
        switch self {
        case .overview: "chart.pie"
        case .transactions: "list.bullet.rectangle"
        case .budgets: "chart.bar"
        case .goals: "target"
        case .assets: "briefcase"
        case .settings: "gearshape"
        }
    }
}
