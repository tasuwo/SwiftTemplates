import SourceryRuntime

extension SourceryProtocol {
    var typeParameters: [String] {
        self.annotatedAssociatedTypes
            .map { associatedType in
                let typeAnnotation = {
                    guard let typeName = associatedTypes[associatedType]?.typeName else { return "" }
                    return ": \(typeName.actualTypeName?.name ?? typeName.name)"
                }()
                return associatedType + typeAnnotation
            }
    }
    
    var annotatedAssociatedTypes: [String] {
        if let type = self.annotations["AssociatedTypes"] as? String {
            return [type]
        } else if let types = self.annotations["AssociatedTypes"] as? [String] {
            return types
        } else {
            return []
        }
    }
    
    var isPublic: Bool {
        return self.accessLevel == "public"
    }
}

extension Method {
    var declarationAsSource: String {
        var source: String = ""
        
        source = "func \(name) "
        
        if isAsync {
            source += "async "
        }
        
        if `throws` {
            source += "throws "
        }
        
        if `rethrows` {
            source += "rethrows "
        }
        
        source += "-> \(returnTypeName)"
        
        return source
    }
    
    func callAsSource(callee: String) -> String {
        var source: String = ""
        
        if `throws` {
            source += "try "
        }
        
        if isAsync {
            source += "await "
        }
        
        source += "\(callee).\(callName)("
        zip(parameters.indices, parameters).forEach { (index, parameter) in
            if let argumentLabel = parameter.argumentLabel {
                source += "\(argumentLabel): "
            }
            source += parameter.name
            if index < parameters.count - 1 {
                source += ", "
            }
        }
        source += ")"
        
        return source
    }
}
