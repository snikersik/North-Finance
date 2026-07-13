import Foundation

struct Money: Equatable, Hashable, Codable {
    let amount: Decimal
    let currency: CurrencyCode
}
