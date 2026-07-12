import SwiftUI

struct FinancialAmountTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(NorthTypography.financialAmount)
            .monospacedDigit()
    }
}

extension View {
    func financialAmountStyle() -> some View {
        modifier(FinancialAmountTextStyle())
    }
}
