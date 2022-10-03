//
//  SwiftTemplatesSpec.swift
//  SwiftTemplatesTests
//
//  Created by Tasuku Tozawa on 2020/04/05.
//  Copyright © 2020 Tasuku Tozawa. All rights reserved.
//

import XCTest

class SwiftTemplatesTest: XCTestCase {
    static func check(template name: String) {
        guard let generatedFilePath = Bundle.module.path(forResource: "Generated/\(name).generated", ofType: "swift") else {
            XCTFail("\(name).generated.swift not found.")
            return
        }
        guard let expectedFilePath = Bundle.module.path(forResource: "Expected/\(name)", ofType: "expected") else {
            XCTFail("\(name).expected not found.")
            return
        }
        guard let generatedFileString = try? String(contentsOfFile: generatedFilePath, encoding: .utf8) else {
            XCTFail("Failed to read \(name).generated.swift")
            return
        }
        guard let expectedFileString = try? String(contentsOfFile: expectedFilePath, encoding: .utf8) else {
            XCTFail("Failed to read \(name).expected")
            return
        }

        let expectedFileLines = expectedFileString
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .filter { !$0.hasPrefix("//") }
        let generatedFileLines = generatedFileString
            .components(separatedBy: .newlines)
            .filter { !$0.isEmpty }
            .filter { !$0.hasPrefix("//") }

        XCTAssertEqual(generatedFileLines.count, expectedFileLines.count)
        guard generatedFileLines.count == expectedFileLines.count else { return }

        zip(generatedFileLines.indices, generatedFileLines).forEach { index, generatedLine in
            XCTAssertEqual(generatedLine, expectedFileLines[index])
        }
    }

    func test_AutoDefaultValue_GeneratesExpectedCode() {
        Self.check(template: "AutoDefaultValue")
        Self.check(template: "TypeErased")
    }
}
