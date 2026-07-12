import Foundation

struct FinancialTransaction: Equatable, Identifiable {
    let id: UUID
    var kind: TransactionKind
    var originalMoney: Money
    var bookingDate: Date
    var note: String?
    let createdAt: Date
    var modifiedAt: Date

    init(
        id: UUID = UUID(),
        kind: TransactionKind,
        originalMoney: Money,
        bookingDate: Date,
        note: String? = nil,
        createdAt: Date,
        modifiedAt: Date
    ) {
        self.id = id
        self.kind = kind
        self.originalMoney = originalMoney
        self.bookingDate = bookingDate
        self.note = note
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
}
