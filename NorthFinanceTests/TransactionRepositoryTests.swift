import Foundation
import XCTest
@testable import NorthFinance

@MainActor
final class TransactionRepositoryTests: XCTestCase {
    func testDecimalAmountsRoundTripExactly() throws {
        let repository = try makeRepository()
        let values = [
            decimal("0.01"),
            decimal("12345678901234567890.12345678"),
            decimal("-42.5000")
        ]

        for (index, value) in values.enumerated() {
            try repository.insert(
                makeTransaction(
                    id: UUID(),
                    amount: value,
                    bookingDate: date(index)
                )
            )
        }

        let fetchedValues = try repository.fetchAll().map(\.originalMoney.amount)
        XCTAssertEqual(Set(fetchedValues), Set(values))
    }

    func testAllSupportedCurrenciesRoundTrip() throws {
        let repository = try makeRepository()

        for (index, currency) in CurrencyCode.allCases.enumerated() {
            try repository.insert(
                makeTransaction(currency: currency, bookingDate: date(index))
            )
        }

        let currencies = try repository.fetchAll().map(\.originalMoney.currency)
        XCTAssertEqual(Set(currencies), Set(CurrencyCode.allCases))
    }

    func testAllTransactionKindsRoundTrip() throws {
        let repository = try makeRepository()

        for (index, kind) in TransactionKind.allCases.enumerated() {
            try repository.insert(makeTransaction(kind: kind, bookingDate: date(index)))
        }

        let kinds = try repository.fetchAll().map(\.kind)
        XCTAssertEqual(Set(kinds), Set(TransactionKind.allCases))
    }

    func testInsertAndFetch() throws {
        let repository = try makeRepository()
        let transaction = makeTransaction(note: "Local note")

        try repository.insert(transaction)

        XCTAssertEqual(try repository.fetch(id: transaction.id), transaction)
        XCTAssertEqual(try repository.fetchAll(), [transaction])
    }

    func testUpdateChangesContentAndModificationTimestamp() throws {
        let modificationDate = Date(timeIntervalSince1970: 1_800_000_000)
        let repository = try makeRepository(now: { modificationDate })
        let original = makeTransaction()
        try repository.insert(original)

        var changed = original
        changed.kind = .income
        changed.originalMoney = Money(amount: decimal("999.99"), currency: .eur)
        changed.bookingDate = Date(timeIntervalSince1970: 1_750_000_000)
        changed.note = "Updated note"

        let updated = try repository.update(changed)

        XCTAssertEqual(updated.id, original.id)
        XCTAssertEqual(updated.createdAt, original.createdAt)
        XCTAssertEqual(updated.modifiedAt, modificationDate)
        XCTAssertEqual(updated.kind, .income)
        XCTAssertEqual(updated.originalMoney, changed.originalMoney)
        XCTAssertEqual(updated.bookingDate, changed.bookingDate)
        XCTAssertEqual(updated.note, "Updated note")
        XCTAssertEqual(try repository.fetch(id: original.id), updated)
    }

    func testDeleteRemovesTransaction() throws {
        let repository = try makeRepository()
        let transaction = makeTransaction()
        try repository.insert(transaction)

        try repository.delete(id: transaction.id)

        XCTAssertNil(try repository.fetch(id: transaction.id))
        XCTAssertTrue(try repository.fetchAll().isEmpty)
    }

    func testStableIdentifierSurvivesRoundTrip() throws {
        let repository = try makeRepository()
        let identifier = UUID()
        try repository.insert(makeTransaction(id: identifier))

        XCTAssertEqual(try repository.fetch(id: identifier)?.id, identifier)
    }

    func testOptionalNoteRoundTripsForNilAndValue() throws {
        let repository = try makeRepository()
        let withoutNote = makeTransaction(bookingDate: date(0), note: nil)
        let withNote = makeTransaction(bookingDate: date(1), note: "Remember this")

        try repository.insert(withoutNote)
        try repository.insert(withNote)

        XCTAssertNil(try repository.fetch(id: withoutNote.id)?.note)
        XCTAssertEqual(try repository.fetch(id: withNote.id)?.note, "Remember this")
    }

    func testInMemoryContainersAreIsolated() throws {
        let firstRepository = try makeRepository()
        let secondRepository = try makeRepository()
        try firstRepository.insert(makeTransaction())

        XCTAssertEqual(try firstRepository.fetchAll().count, 1)
        XCTAssertTrue(try secondRepository.fetchAll().isEmpty)
    }

    func testFreshInMemoryContainerIsEmpty() throws {
        let repository = try makeRepository()

        XCTAssertTrue(try repository.fetchAll().isEmpty)
    }

    private func makeRepository(
        now: @escaping () -> Date = Date.init
    ) throws -> SwiftDataTransactionRepository {
        let container = try ModelContainerFactory.makeInMemoryContainer()
        return SwiftDataTransactionRepository(
            modelContainer: container,
            now: now
        )
    }

    private func makeTransaction(
        id: UUID = UUID(),
        kind: TransactionKind = .expense,
        amount: Decimal = Decimal(string: "123.45")!,
        currency: CurrencyCode = .pln,
        bookingDate: Date = Date(timeIntervalSince1970: 1_700_000_000),
        note: String? = nil
    ) -> FinancialTransaction {
        let createdAt = Date(timeIntervalSince1970: 1_690_000_000)
        return FinancialTransaction(
            id: id,
            kind: kind,
            originalMoney: Money(amount: amount, currency: currency),
            bookingDate: bookingDate,
            note: note,
            createdAt: createdAt,
            modifiedAt: createdAt
        )
    }

    private func date(_ offset: Int) -> Date {
        Date(timeIntervalSince1970: 1_700_000_000 + TimeInterval(offset))
    }

    private func decimal(_ value: String) -> Decimal {
        guard let decimal = Decimal(string: value, locale: Locale(identifier: "en_US_POSIX")) else {
            XCTFail("Invalid decimal fixture: \(value)")
            return .zero
        }
        return decimal
    }
}
