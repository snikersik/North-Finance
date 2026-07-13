import Foundation
import XCTest

final class LocalizationTests: XCTestCase {
    func testEnglishIsDevelopmentLocalization() {
        XCTAssertEqual(Bundle.main.developmentLocalization, "en")
    }

    func testApplicationBundleContainsEnglishAndPolishLocalizations() {
        XCTAssertTrue(Bundle.main.localizations.contains("en"))
        XCTAssertTrue(Bundle.main.localizations.contains("pl"))
    }

    func testEnglishTranslations() {
        assertEnglish("North Finance", equals: "North Finance")
        assertEnglish("Overview", equals: "Overview")
        assertEnglish("Transactions", equals: "Transactions")
        assertEnglish("Budgets", equals: "Budgets")
        assertEnglish("Goals", equals: "Goals")
        assertEnglish("Assets", equals: "Assets")
        assertEnglish("Settings", equals: "Settings")
        assertEnglish("Income", equals: "Income")
        assertEnglish("Expenses", equals: "Expenses")
        assertEnglish("Available", equals: "Available")
        assertEnglish("No value", equals: "No value")
        assertEnglish("No data yet", equals: "No data yet")
        assertEnglish(
            "Items you add will appear here.",
            equals: "Items you add will appear here."
        )
        assertEnglish("Welcome to North Finance", equals: "Welcome to North Finance")
        assertEnglish(
            "Start by adding your first item.",
            equals: "Start by adding your first item."
        )
        assertEnglish("Loading…", equals: "Loading…")
        assertEnglish("Something went wrong", equals: "Something went wrong")
        assertEnglish(
            "Your saved data has not been changed.",
            equals: "Your saved data has not been changed."
        )
        assertEnglish("Try Again", equals: "Try Again")
        assertEnglish(
            "Your income and expenses will appear here.",
            equals: "Your income and expenses will appear here."
        )
        assertEnglish(
            "Your category budgets will appear here.",
            equals: "Your category budgets will appear here."
        )
        assertEnglish(
            "Your savings goals will appear here.",
            equals: "Your savings goals will appear here."
        )
        assertEnglish(
            "Your assets will appear here.",
            equals: "Your assets will appear here."
        )
        assertEnglish(
            "North Finance preferences will appear here.",
            equals: "North Finance preferences will appear here."
        )
    }

    func testPolishTranslations() {
        assertPolish("North Finance", equals: "North Finance")
        assertPolish("Overview", equals: "Podsumowanie")
        assertPolish("Transactions", equals: "Transakcje")
        assertPolish("Budgets", equals: "Budżety")
        assertPolish("Goals", equals: "Cele")
        assertPolish("Assets", equals: "Majątek")
        assertPolish("Settings", equals: "Ustawienia")
        assertPolish("Income", equals: "Przychody")
        assertPolish("Expenses", equals: "Wydatki")
        assertPolish("Available", equals: "Dostępne środki")
        assertPolish("No value", equals: "Brak wartości")
        assertPolish("No data yet", equals: "Brak danych")
        assertPolish(
            "Items you add will appear here.",
            equals: "Dodane elementy pojawią się tutaj."
        )
        assertPolish("Welcome to North Finance", equals: "Witaj w North Finance")
        assertPolish(
            "Start by adding your first item.",
            equals: "Zacznij od dodania pierwszego elementu."
        )
        assertPolish("Loading…", equals: "Ładowanie…")
        assertPolish("Something went wrong", equals: "Coś poszło nie tak")
        assertPolish(
            "Your saved data has not been changed.",
            equals: "Zapisane dane nie zostały zmienione."
        )
        assertPolish("Try Again", equals: "Spróbuj ponownie")
        assertPolish(
            "Your income and expenses will appear here.",
            equals: "Tutaj pojawią się Twoje przychody i wydatki."
        )
        assertPolish(
            "Your category budgets will appear here.",
            equals: "Tutaj pojawią się Twoje budżety kategorii."
        )
        assertPolish(
            "Your savings goals will appear here.",
            equals: "Tutaj pojawią się Twoje cele oszczędnościowe."
        )
        assertPolish(
            "Your assets will appear here.",
            equals: "Tutaj pojawią się informacje o Twoim majątku."
        )
        assertPolish(
            "North Finance preferences will appear here.",
            equals: "Tutaj pojawią się ustawienia North Finance."
        )
    }

    private func assertEnglish(
        _ key: String,
        equals expected: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        assertTranslation(key, language: "en", equals: expected, file: file, line: line)
    }

    private func assertPolish(
        _ key: String,
        equals expected: String,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        assertTranslation(key, language: "pl", equals: expected, file: file, line: line)
    }

    private func assertTranslation(
        _ key: String,
        language: String,
        equals expected: String,
        file: StaticString,
        line: UInt
    ) {
        guard
            let localizationURL = Bundle.main.url(
                forResource: language,
                withExtension: "lproj"
            ),
            let localizationBundle = Bundle(url: localizationURL)
        else {
            XCTFail(
                "Missing localization resources for \(language).",
                file: file,
                line: line
            )
            return
        }

        XCTAssertEqual(
            localizationBundle.localizedString(
                forKey: key,
                value: nil,
                table: "Localizable"
            ),
            expected,
            file: file,
            line: line
        )
    }
}
