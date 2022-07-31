//
//  AutoDefaultValue.swift
//  SwiftTemplatesTests
//
//  Created by Tasuku Tozawa on 2020/04/05.
//  Copyright © 2020 Tasuku Tozawa. All rights reserved.
//

import Foundation

protocol AutoDefaultValue {}

struct AutoDefaultValueStruct: AutoDefaultValue {
    // MARK: - Basic Types

    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float

    // MARK: - Optional

    let optionalString: String?
    let optionalBool: Bool?
    let optionalInt: Int?
    let optionalUInt: UInt?
    let optionalDouble: Double?
    let optionalFloat: Float?

    // MARK: - Implicity Unwrapped Optional

    let implicityUnwrappedOptionalString: String!
    let implicityUnwrappedOptionalBool: Bool!
    let implicityUnwrappedOptionalInt: Int!
    let implicityUnwrappedOptionalUInt: UInt!
    let implicityUnwrappedOptionalDouble: Double!
    let implicityUnwrappedOptionalFloat: Float!

    // MARK: - Array

    let arrayString: [String]
    let arrayBool: [Bool]
    let arrayInt: [Int]
    let arrayUInt: [UInt]
    let arrayDouble: [Double]
    let arrayFloat: [Float]

    // MARK: - Dictionary

    let dictionary: [String:Any]

    // MARK: - Enum

    let enumValue: AutoDefaultValueEnum
    let enumValueHasAssociatedValues: AutoDefaultValueEnumHasAssociatedValues

    // MARK: - Tuple

    let tuple: (String, integer: Int, Bool, array: [String])

    // MARK: - Void

    let voidValue: Void

    // MARK: - AutoDefaultValue

    let other: AutoDefaultValueOtherStruct

    // MARK: - Class

    let classValue: AutoDefaultValueClass

    // MARK: - [Extra] Simple Type Mapping

    let date: Date
    let url: URL

    // MARK: - [Extra] Generics Type Mapping

    let integerClosedRange: ClosedRange<Int>
    let doubleClosedRange: ClosedRange<Double>
    let stringSet: Set<String>
    let integerSet: Set<Int>
}

// MARK: - Namespaces

enum AutoDefaultValueNamespace {}

extension AutoDefaultValueNamespace {
    struct AutoDefaultValueInnerStruct1: AutoDefaultValue {
        let string: String
    }

    struct AutoDefaultValueInnerStruct2: AutoDefaultValue {
        let innerStruct: AutoDefaultValueInnerStruct1
    }
}

// MARK: - Definitions for test cases

enum AutoDefaultValueEnum {
    case foo
    case bar
}

enum AutoDefaultValueEnumHasAssociatedValues {
    case foo(String, integer: Int, Bool, array: [String])
    case bar(Int)
}

struct AutoDefaultValueOtherStruct: AutoDefaultValue {
    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float
}

class AutoDefaultValueClass {
    init() {}
}

// MARK: - Use Public

protocol AutoDefaultValueUsePublic {}

public struct AutoDefaultValuePublicStruct: AutoDefaultValue, AutoDefaultValueUsePublic {
    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float
}

public struct AutoDefaultValuePublicStructNotGenerated: AutoDefaultValueUsePublic {
    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float
}

// MARK: - Use Initializer

struct AutoDefaultValueUseInitializer: AutoDefaultValue {
    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float

    // sourcery: AutoDefaultValueUseThisInitializer
    init(string: String, uint: UInt, float: Float) {
        self.string = string
        self.bool = false
        self.integer = 0
        self.unsignedInterger = uint
        self.double = 0
        self.float = float
    }

    // sourcery: AutoDefaultValueUseThisInitializer
    init(bool: Bool, int: Int, double: Double) {
        self.string = ""
        self.bool = bool
        self.integer = int
        self.unsignedInterger = 0
        self.double = double
        self.float = 0
    }
}

struct AutoDefaultValueUseFailableInitializer: AutoDefaultValue {
    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float

    // sourcery: AutoDefaultValueUseThisInitializer
    init?(string: String, uint: UInt, float: Float) {
        self.string = string
        self.bool = false
        self.integer = 0
        self.unsignedInterger = uint
        self.double = 0
        self.float = float
    }
}

struct AutoDefaultValueUseThrowableInitializer: AutoDefaultValue {
    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float

    // sourcery: AutoDefaultValueUseThisInitializer
    init(string: String, uint: UInt, float: Float) throws {
        self.string = string
        self.bool = false
        self.integer = 0
        self.unsignedInterger = uint
        self.double = 0
        self.float = float
    }
}

struct AutoDefaultValueUseFailableThrowableInitializer: AutoDefaultValue {
    let string: String
    let bool: Bool
    let integer: Int
    let unsignedInterger: UInt
    let double: Double
    let float: Float

    // sourcery: AutoDefaultValueUseThisInitializer
    init?(string: String, uint: UInt, float: Float) throws {
        self.string = string
        self.bool = false
        self.integer = 0
        self.unsignedInterger = uint
        self.double = 0
        self.float = float
    }
}
