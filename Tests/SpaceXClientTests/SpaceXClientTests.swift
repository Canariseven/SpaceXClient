import XCTest
@testable import SpaceXClient

final class SpaceXClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SpaceXClient().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
