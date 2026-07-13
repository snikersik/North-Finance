import Foundation

enum TransactionKind: String, CaseIterable, Codable {
    case income
    case expense
    case transfer
}
