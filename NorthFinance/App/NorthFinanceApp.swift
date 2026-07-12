import SwiftData
import SwiftUI

@main
struct NorthFinanceApp: App {
    private let modelContainer: ModelContainer

    init() {
        do {
            modelContainer = try ModelContainerFactory.makePersistentContainer()
        } catch {
            fatalError("Unable to create the local model container: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            AppShellView()
        }
        .modelContainer(modelContainer)
        .defaultSize(width: 1_100, height: 720)
    }
}
