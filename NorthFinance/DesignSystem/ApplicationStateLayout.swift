import SwiftUI

private struct ApplicationStateLayoutModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: NorthLayout.contentMaximumWidth)
            .padding(NorthSpacing.spacious)
            .background {
                RoundedRectangle(cornerRadius: NorthRadius.panel, style: .continuous)
                    .fill(NorthColor.surface)
            }
            .overlay {
                RoundedRectangle(cornerRadius: NorthRadius.panel, style: .continuous)
                    .stroke(NorthColor.separator)
            }
            .padding(NorthSpacing.spacious)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(NorthColor.background)
    }
}

extension View {
    func applicationStateLayout() -> some View {
        modifier(ApplicationStateLayoutModifier())
    }
}
