import Foundation
import SwiftData

@Model
final class TransactionRecord {
    @Attribute(.unique) var id: UUID
    var kindRawValue: String
    var originalAmount: String
    var originalCurrencyRawValue: String
    var bookingDate: Date
    var note: String?
    var createdAt: Date
    var modifiedAt: Date

    init(
        id: UUID,
        kindRawValue: String,
        originalAmount: String,
        originalCurrencyRawValue: String,
        bookingDate: Date,
        note: String?,
        createdAt: Date,
        modifiedAt: Date
    ) {
        self.id = id
        self.kindRawValue = kindRawValue
        self.originalAmount = originalAmount
        self.originalCurrencyRawValue = originalCurrencyRawValue
        self.bookingDate = bookingDate
        self.note = note
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
}

enum NorthFinanceSchemaV1: VersionedSchema {
    static let versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] {
        [TransactionRecord.self]
    }
}
