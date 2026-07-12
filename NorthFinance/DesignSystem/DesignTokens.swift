import AppKit
import SwiftUI

enum NorthColor {
    static let background = Color(nsColor: .windowBackgroundColor)
    static let surface = Color(nsColor: .controlBackgroundColor)
    static let elevatedSurface = Color(nsColor: .textBackgroundColor)

    static let primaryText = Color(nsColor: .labelColor)
    static let secondaryText = Color(nsColor: .secondaryLabelColor)
    static let tertiaryText = Color(nsColor: .tertiaryLabelColor)

    static let accent = Color(nsColor: .controlAccentColor)
    static let selection = Color(nsColor: .selectedContentBackgroundColor)
    static let positive = Color(nsColor: .systemGreen)
    static let caution = Color(nsColor: .systemOrange)
    static let destructive = Color(nsColor: .systemRed)
    static let separator = Color(nsColor: .separatorColor)
    static let focus = Color(nsColor: .keyboardFocusIndicatorColor)
}

enum NorthSpacing {
    static let compact: CGFloat = 8
    static let regular: CGFloat = 16
    static let spacious: CGFloat = 24
}

enum NorthRadius {
    static let control: CGFloat = 8
    static let card: CGFloat = 12
    static let panel: CGFloat = 16
}

enum NorthTypography {
    static let pageTitle = Font.largeTitle.weight(.semibold)
    static let cardTitle = Font.headline
    static let body = Font.body
    static let secondary = Font.callout
    static let financialAmount = Font.title2.weight(.semibold).monospacedDigit()
}

enum NorthLayout {
    static let summaryCardMinimumWidth: CGFloat = 220
    static let contentMaximumWidth: CGFloat = 960
}
