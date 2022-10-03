//
//  Created by Tasuku Tozawa on 2022/07/31.
//

import Foundation

// sourcery: TypeErased, AssociatedTypes = One
protocol SingleAssociatedType {
    associatedtype One

    var immutableOne: One { get }
    var mutaleOne: One { get set }
    
    func getOne() -> One
    func takeOne(_ one: One)
    func takeOneWithLabel(one: One)
    func throwMethod() throws
    func asyncMethod() async
    func throwAsyncMethod() async throws
}

protocol MyTypeA {}
protocol MyTypeB {}
protocol MyTypeC {}

// sourcery: TypeErased, AssociatedTypes = One, AssociatedTypes = Two, AssociatedTypes = Three
protocol MultipleAssociatedType {
    associatedtype One
    associatedtype Two: MyTypeA
    associatedtype Three: MyTypeB & MyTypeC

    var immutableOne: One { get }
    var mutaleOne: One { get set }
    var immutableTwo: Two { get }
    var mutaleTwo: Two { get set }
    var immutableThree: Three { get }
    var mutaleThree: Three { get set }
    
    func getAll() -> (One, Two, Three)
    func takeAll(one: One, two: Two, three: Three)
}

// sourcery: TypeErased, AssociatedTypes = One, AccessLevel = public
public protocol PublicAssociatedType {
    associatedtype One

    func getOne() -> One
}
