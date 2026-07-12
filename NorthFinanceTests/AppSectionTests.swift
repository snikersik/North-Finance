import XCTest
@testable import NorthFinance

final class AppSectionTests: XCTestCase {
    func testInitialSectionsAreCompleteAndOrdered() {
        XCTAssertEqual(
            AppSection.allCases.map(\.rawValue),
            ["overview", "transactions", "budgets", "goals", "assets", "settings"]
        )
    }

    func testSectionIdentifiersAreStable() {
        for section in AppSection.allCases {
            XCTAssertEqual(section.id, section.rawValue)
        }
    }

    func testEverySectionProvidesAnIcon() {
        for section in AppSection.allCases {
            XCTAssertFalse(section.systemImage.isEmpty)
        }
    }
}
