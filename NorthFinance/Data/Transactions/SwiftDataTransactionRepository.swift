import Foundation
import SwiftData

@MainActor
final class SwiftDataTransactionRepository: TransactionRepository {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    private let now: () -> Date

    init(
        modelContainer: ModelContainer,
        now: @escaping () -> Date = Date.init
    ) {
        self.modelContainer = modelContainer
        modelContext = ModelContext(modelContainer)
        self.now = now
    }

    func insert(_ transaction: FinancialTransaction) throws {
        guard try record(id: transaction.id) == nil else {
            throw TransactionPersistenceError.duplicateIdentifier(transaction.id)
        }

        modelContext.insert(
            TransactionRecord(
                id: transaction.id,
                kindRawValue: transaction.kind.rawValue,
                originalAmount: DecimalStorage.encode(transaction.originalMoney.amount),
                originalCurrencyRawValue: transaction.originalMoney.currency.rawValue,
                bookingDate: transaction.bookingDate,
                note: transaction.note,
                createdAt: transaction.createdAt,
                modifiedAt: transaction.modifiedAt
            )
        )
        try modelContext.save()
    }

    func fetch(id: UUID) throws -> FinancialTransaction? {
        try record(id: id).map(mapToDomain)
    }

    func fetchAll() throws -> [FinancialTransaction] {
        let descriptor = FetchDescriptor<TransactionRecord>(
            sortBy: [SortDescriptor(\.bookingDate, order: .reverse)]
        )
        return try modelContext.fetch(descriptor).map(mapToDomain)
    }

    @discardableResult
    func update(_ transaction: FinancialTransaction) throws -> FinancialTransaction {
        guard let record = try record(id: transaction.id) else {
            throw TransactionPersistenceError.transactionNotFound(transaction.id)
        }

        record.kindRawValue = transaction.kind.rawValue
        record.originalAmount = DecimalStorage.encode(transaction.originalMoney.amount)
        record.originalCurrencyRawValue = transaction.originalMoney.currency.rawValue
        record.bookingDate = transaction.bookingDate
        record.note = transaction.note
        record.modifiedAt = now()
        try modelContext.save()

        return try mapToDomain(record)
    }

    func delete(id: UUID) throws {
        guard let record = try record(id: id) else {
            throw TransactionPersistenceError.transactionNotFound(id)
        }

        modelContext.delete(record)
        try modelContext.save()
    }

    private func record(id: UUID) throws -> TransactionRecord? {
        let identifier = id
        var descriptor = FetchDescriptor<TransactionRecord>(
            predicate: #Predicate { record in
                record.id == identifier
            }
        )
        descriptor.fetchLimit = 1

        return try modelContext.fetch(descriptor).first
    }

    private func mapToDomain(_ record: TransactionRecord) throws -> FinancialTransaction {
        guard let kind = TransactionKind(rawValue: record.kindRawValue) else {
            throw TransactionPersistenceError.invalidKind(record.kindRawValue)
        }
        guard let currency = CurrencyCode(rawValue: record.originalCurrencyRawValue) else {
            throw TransactionPersistenceError.invalidCurrency(record.originalCurrencyRawValue)
        }

        return FinancialTransaction(
            id: record.id,
            kind: kind,
            originalMoney: Money(
                amount: try DecimalStorage.decode(record.originalAmount),
                currency: currency
            ),
            bookingDate: record.bookingDate,
            note: record.note,
            createdAt: record.createdAt,
            modifiedAt: record.modifiedAt
        )
    }
}
