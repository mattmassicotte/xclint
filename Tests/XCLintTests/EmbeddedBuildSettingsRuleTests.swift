import XCTest

@testable import XCLinting
import XcodeProj

final class EmbeddedBuildSettingsRuleTests: XCTestCase {
	func testProjectWithBuildSettings() throws {
		let url = try Bundle.module.testDataURL(named: "StockMacOSApp.xcodeproj")

		let project = try XcodeProj(pathString: url.path)

		let env = XCLinter.Environment(
			project: project,
			projectRootURL: url,
			configuration: Configuration()
		)

		let violations = embeddedBuildSettingsRule(env)

		XCTAssertFalse(violations.isEmpty)
	}

	func testProjectWithBuildSettingsRemoved() throws {
		let url = try Bundle.module.testDataURL(named: "BuildSettingsRemoved.xcodeproj")

		let project = try XcodeProj(pathString: url.path)

		let env = XCLinter.Environment(
			project: project,
			projectRootURL: url,
			configuration: Configuration()
		)

		let violations = embeddedBuildSettingsRule(env)

		XCTAssertTrue(violations.isEmpty)
	}
}

