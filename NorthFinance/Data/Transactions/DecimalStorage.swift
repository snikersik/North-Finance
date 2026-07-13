import Foundation

enum DecimalStorage {
    private static let locale = Locale(identifier: "en_US_POSIX")

    static func encode(_ value: Decimal) -> String {
        var value = value
        return NSDecimalString(&value, locale as NSLocale)
    }

    static func decode(_ value: String) throws -> Decimal {
        guard let decimal = Decimal(string: value, locale: locale) else {
            throw TransactionPersistenceError.invalidAmount(value)
        }

        return decimal
    }
}
