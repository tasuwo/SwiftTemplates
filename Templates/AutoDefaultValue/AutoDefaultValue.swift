import Foundation
import SourceryRuntime

// MARK: - DefaultValueGeneratable

protocol DefaultValueGeneratable {
    var typeName: TypeName { get }
    var type: Type? { get }
}
extension Variable: DefaultValueGeneratable {}
extension TupleElement: DefaultValueGeneratable {}
extension AssociatedValue: DefaultValueGeneratable {}
extension GenericTypeParameter: DefaultValueGeneratable {}

extension DefaultValueGeneratable {
    var absoluteTypeName: String {
        if let typeName = self.typeName.actualTypeName {
            return typeName.name
        } else {
            return self.typeName.name
        }
    }

    func hasAnnotationOrImplements(_ identifier: String) -> Bool {
        return self.type?.annotations.keys.contains(identifier) == true
            || self.type?.implements.keys.contains(identifier) == true
    }
}

// MARK: - Default Value

func defaultValue(from variable: DefaultValueGeneratable, identifiedBy identifier: String) -> String {
    guard !variable.typeName.isOptional else {
        return "nil"
    }

    guard !variable.hasAnnotationOrImplements(identifier) else {
        return "\(variable.absoluteTypeName).makeDefault()"
    }

    guard !variable.typeName.isVoid else {
        return "()"
    }

    guard !variable.typeName.isTuple else {
        return defaultValue(from: variable.typeName.tuple!, identifiedBy: identifier)
    }

    guard variable.type?.kind != "enum" else {
        return defaultValue(from: variable.type as! Enum, identifiedBy: identifier)
    }

    guard variable.type?.kind != "class" else {
        return "\(variable.typeName.name)()"
    }

    if variable.typeName.isArray {
        return "[]"
    } else if variable.typeName.isDictionary {
        return "[:]"
    } else if variable.typeName.isGeneric {
        return defaultValue(from: variable.typeName.generic!, identifiedBy: identifier)
    }

    return defaultValue(from: variable.typeName.name)
}

func defaultValue(from typeName: String) -> String {
    switch typeName {
    case "String":
        return "\"\""
    case "Bool":
        return "false"
    case "Int", "UInt", "Double", "Float":
        return "0"
    default:
        return DefaultValueSettings.defaultValue(from: typeName)
    }
}

func defaultValue(from enumType: Enum, identifiedBy identifier: String) -> String {
    guard let firstCase = enumType.cases.first else {
        fatalError("Enum MUST have at least one element.")
    }
    if firstCase.associatedValues.isEmpty {
        return ".\(firstCase.name)"
    } else {
        let defaultAssociatedValues = firstCase
            .associatedValues
            .map { associatedValue -> String in
                let value = defaultValue(from: associatedValue, identifiedBy: identifier)
                if let label = associatedValue.localName {
                    return "\(label): \(value)"
                } else {
                    return value
                }
            }
            .joined(separator: ", ")
        return ".\(firstCase.name)(\(defaultAssociatedValues))"
    }
}

func defaultValue(from tupleType: TupleType, identifiedBy identifier: String) -> String {
    let elements = tupleType
        .elements
        .map { defaultValue(from: $0, identifiedBy: identifier) }
        .joined(separator: ", ")
    return "(\(elements))"
}

func defaultValue(from genericType: GenericType, identifiedBy identifier: String) -> String {
    let typeParameterDefaultValueById = genericType
        .typeParameters
        .enumerated()
        .reduce(into: [String:String]()) { dic, e in
            let value = defaultValue(from: e.element, identifiedBy: identifier)
            let id = "@\(e.offset)"
            dic[id] = value
        }
    let format = DefaultValueSettings.defaultValueFormat(for: genericType.name)

    return typeParameterDefaultValueById
        .reduce(into: format) { result, e in
            result = result.replacingOccurrences(of: e.key, with: e.value)
        }
}

// MARK: - Configuration

extension Dictionary where Key == String, Value == NSObject {
    var importStatements: [String] {
        return self.resolveModules(for: "testable_import").map { "@testable import \($0)" }
            + self.resolveModules(for: "import").map { "import \($0)" }
    }

    private func resolveModules(for key: String) -> [String] {
        if let module = self[key] as? String {
            return [module]
        } else if let modules = self[key] as? [String] {
            return modules
        } else {
            return []
        }
    }
}

// MARK: - Indentifier

let identifier = "AutoDefaultValue"
let publicIdentifier = "AutoDefaultValuePublic"
let validIdentifiers = [identifier, publicIdentifier]
