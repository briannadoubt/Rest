import XCTest
@testable import Rest

final class RestTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Rest().text, "Hello, World!")
    }
}
