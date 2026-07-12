import Foundation

enum TransactionPersistenceError: Error, Equatable {
    case duplicateIdentifier(UUID)
    case transactionNotFound(UUID)
    case invalidAmount(String)
    case invalidCurrency(String)
    case invalidKind(String)
}
