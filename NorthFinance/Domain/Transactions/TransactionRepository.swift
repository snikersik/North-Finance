import Foundation

@MainActor
protocol TransactionRepository {
    func insert(_ transaction: FinancialTransaction) throws
    func fetch(id: UUID) throws -> FinancialTransaction?
    func fetchAll() throws -> [FinancialTransaction]
    @discardableResult
    func update(_ transaction: FinancialTransaction) throws -> FinancialTransaction
    func delete(id: UUID) throws
}
