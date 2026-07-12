import SwiftData

enum NorthFinanceMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [NorthFinanceSchemaV1.self]
    }

    static var stages: [MigrationStage] {
        []
    }
}
