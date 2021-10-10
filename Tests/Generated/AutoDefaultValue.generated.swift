// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import ModuleA
@testable import ModuleB

import Foundation.NSDate
import Foundation.NSURL

extension AutoDefaultValueNamespace.AutoDefaultValueInnerStruct1 {
    static func makeDefault(
        string: String = ""
    ) -> Self {
        return .init(
            string: string
        )
    }
}

extension AutoDefaultValueNamespace.AutoDefaultValueInnerStruct2 {
    static func makeDefault(
        innerStruct: AutoDefaultValueNamespace.AutoDefaultValueInnerStruct1 = AutoDefaultValueNamespace.AutoDefaultValueInnerStruct1.makeDefault()
    ) -> Self {
        return .init(
            innerStruct: innerStruct
        )
    }
}

extension AutoDefaultValueOtherStruct {
    static func makeDefault(
        string: String = "",
        bool: Bool = false,
        integer: Int = 0,
        unsignedInterger: UInt = 0,
        double: Double = 0,
        float: Float = 0
    ) -> Self {
        return .init(
            string: string,
            bool: bool,
            integer: integer,
            unsignedInterger: unsignedInterger,
            double: double,
            float: float
        )
    }
}

public extension AutoDefaultValuePublicStruct {
    static func makeDefault(
        string: String = "",
        bool: Bool = false,
        integer: Int = 0,
        unsignedInterger: UInt = 0,
        double: Double = 0,
        float: Float = 0
    ) -> Self {
        return .init(
            string: string,
            bool: bool,
            integer: integer,
            unsignedInterger: unsignedInterger,
            double: double,
            float: float
        )
    }
}

extension AutoDefaultValueStruct {
    static func makeDefault(
        string: String = "",
        bool: Bool = false,
        integer: Int = 0,
        unsignedInterger: UInt = 0,
        double: Double = 0,
        float: Float = 0,
        optionalString: String? = nil,
        optionalBool: Bool? = nil,
        optionalInt: Int? = nil,
        optionalUInt: UInt? = nil,
        optionalDouble: Double? = nil,
        optionalFloat: Float? = nil,
        implicityUnwrappedOptionalString: String! = nil,
        implicityUnwrappedOptionalBool: Bool! = nil,
        implicityUnwrappedOptionalInt: Int! = nil,
        implicityUnwrappedOptionalUInt: UInt! = nil,
        implicityUnwrappedOptionalDouble: Double! = nil,
        implicityUnwrappedOptionalFloat: Float! = nil,
        arrayString: [String] = [],
        arrayBool: [Bool] = [],
        arrayInt: [Int] = [],
        arrayUInt: [UInt] = [],
        arrayDouble: [Double] = [],
        arrayFloat: [Float] = [],
        dictionary: [String:Any] = [:],
        enumValue: AutoDefaultValueEnum = .foo,
        enumValueHasAssociatedValues: AutoDefaultValueEnumHasAssociatedValues = .foo("", integer: 0, false, array: []),
        tuple: (String, integer: Int, Bool, array: [String]) = ("", 0, false, []),
        voidValue: Void = (),
        other: AutoDefaultValueOtherStruct = AutoDefaultValueOtherStruct.makeDefault(),
        classValue: AutoDefaultValueClass = AutoDefaultValueClass(),
        date: Date = Date(timeIntervalSince1970: 0),
        url: URL = URL(string: "https://xxx.xxxx.xx")!,
        integerClosedRange: ClosedRange<Int> = 0...0,
        doubleClosedRange: ClosedRange<Double> = 0...0,
        stringSet: Set<String> = [],
        integerSet: Set<Int> = []
    ) -> Self {
        return .init(
            string: string,
            bool: bool,
            integer: integer,
            unsignedInterger: unsignedInterger,
            double: double,
            float: float,
            optionalString: optionalString,
            optionalBool: optionalBool,
            optionalInt: optionalInt,
            optionalUInt: optionalUInt,
            optionalDouble: optionalDouble,
            optionalFloat: optionalFloat,
            implicityUnwrappedOptionalString: implicityUnwrappedOptionalString,
            implicityUnwrappedOptionalBool: implicityUnwrappedOptionalBool,
            implicityUnwrappedOptionalInt: implicityUnwrappedOptionalInt,
            implicityUnwrappedOptionalUInt: implicityUnwrappedOptionalUInt,
            implicityUnwrappedOptionalDouble: implicityUnwrappedOptionalDouble,
            implicityUnwrappedOptionalFloat: implicityUnwrappedOptionalFloat,
            arrayString: arrayString,
            arrayBool: arrayBool,
            arrayInt: arrayInt,
            arrayUInt: arrayUInt,
            arrayDouble: arrayDouble,
            arrayFloat: arrayFloat,
            dictionary: dictionary,
            enumValue: enumValue,
            enumValueHasAssociatedValues: enumValueHasAssociatedValues,
            tuple: tuple,
            voidValue: voidValue,
            other: other,
            classValue: classValue,
            date: date,
            url: url,
            integerClosedRange: integerClosedRange,
            doubleClosedRange: doubleClosedRange,
            stringSet: stringSet,
            integerSet: integerSet
        )
    }
}

