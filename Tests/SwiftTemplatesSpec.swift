//
//  SwiftTemplatesSpec.swift
//  SwiftTemplatesTests
//
//  Created by Tasuku Tozawa on 2020/04/05.
//  Copyright © 2020 Tasuku Tozawa. All rights reserved.
//

import Foundation
import Nimble
import Quick

class SwiftTemplatesSpec: QuickSpec {
    static func check(template name: String) {
        guard let generatedFilePath = Bundle(for: self).path(forResource: "\(name).generated", ofType: "swift") else {
            fail("\(name).generated.swift not found.")
            return
        }
        guard let expectedFilePath = Bundle(for: self).path(forResource: name, ofType: "expected") else {
            fail("\(name).expected not found.")
            return
        }
        guard let generatedFileString = try? String(contentsOfFile: generatedFilePath, encoding: .utf8) else {
            fail("Failed to read \(name).generated.swift")
            return
        }
        guard let expectedFileString = try? String(contentsOfFile: expectedFilePath, encoding: .utf8) else {
            fail("Failed to read \(name).expected")
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

        expect(generatedFileLines.count).to(equal(expectedFileLines.count))
        guard generatedFileLines.count == expectedFileLines.count else { return }

        zip(generatedFileLines.indices, generatedFileLines).forEach { index, generatedLine in
            expect(generatedLine).to(equal(expectedFileLines[index]))
        }
    }

    override func spec() {
        describe("AutoDefaultValue") {
            it("generates expected code") {
                Self.check(template: "AutoDefaultValue")
            }
        }
    }
}
