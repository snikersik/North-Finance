# Localization

North Finance uses `NorthFinance/Localizable.xcstrings` as the source of truth
for user-facing interface copy. English (`en`) is the development and fallback
language. Polish (`pl`) is the second supported localization. With no in-app
language override, SwiftUI automatically follows the user's macOS language
preference.

## Adding user-facing text

1. Use an English source key in SwiftUI, preferably as a string literal accepted
   by `Text`, `Label`, `navigationTitle`, `accessibilityLabel`, or as a
   `LocalizedStringResource` passed to a reusable component.
2. Add the same English key to `Localizable.xcstrings`.
3. Provide reviewed English and Polish values in the catalog.
4. Build and run the localization tests before opening a Pull Request.

Preview-only labels such as `previewDisplayName` do not ship to users and may
remain English.

Localized text must never be used as an identifier, enum raw value, domain
value, analytics key, or SwiftData persistence value. Stable identifiers remain
language-independent; localization is applied only at the presentation boundary.

## Manual verification in Xcode

To verify a specific language without changing macOS globally:

1. Open `NorthFinance.xcodeproj` and select the `NorthFinance` scheme.
2. Choose **Product > Scheme > Edit Scheme**.
3. Select **Run > Options** and set **App Language** to **English** or **Polish**.
4. Run the application and inspect the sidebar, Overview cards, navigation
   titles, placeholder screens, and VoiceOver labels.

Set **App Language** back to **System Language** to verify that the application
automatically follows the preferred language configured in macOS.
