import SwiftData

enum ModelContainerFactory {
    static func makePersistentContainer() throws -> ModelContainer {
        let schema = Schema(versionedSchema: NorthFinanceSchemaV1.self)

        return try ModelContainer(
            for: schema,
            migrationPlan: NorthFinanceMigrationPlan.self
        )
    }

    static func makeInMemoryContainer() throws -> ModelContainer {
        let schema = Schema(versionedSchema: NorthFinanceSchemaV1.self)
        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: true
        )

        return try ModelContainer(
            for: schema,
            migrationPlan: NorthFinanceMigrationPlan.self,
            configurations: configuration
        )
    }
}
