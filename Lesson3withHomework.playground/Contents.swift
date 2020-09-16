
//: # 3_Struct Class - constructions
// + enum
// Tuple
//: [Classes And Structures](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)
/*:
 Structures and classes in Swift have many things in common. Both can:
 * Define properties to store values - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
 * Define methods to provide functionality - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
 * Define subscripts to provide access to their values using subscript syntax - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html)
 * Define initializers to set up their initial state - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
 * Be extended to expand their functionality beyond a default implementation - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
 * Conform to protocols to provide standard functionality of a certain kind - [Documentation](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
 */

/*:
 Classes have additional capabilities that structures don’t have:
 * Inheritance enables one class to inherit the characteristics of another.
 * Type casting enables you to check and interpret the type of a class instance at runtime.
 * Deinitializers enable an instance of a class to free up any resources it has assigned.
 * Reference type
 * Reference counting allows more than one reference to a class instance.
 */

/*:
 All structures have an automatically generated memberwise initializer, classes - don't
 * Structures have value type
 */
import Foundation

// Value/Reference types
// Value:
var x = 10
var y = x
x = 5

// Reference:
class Ref {
    var x = 10
}

var xxx = Ref()
xxx.x
var yyy = xxx
yyy.x

xxx.x = 1
yyy.x

/*:
Properties
 */
struct CustomStruct {
    // properties
    var property: Int
    let constantProperty: Int = 0
    // initializers
    init() {
        self.property = 6
    }
    // methods
}
//CustomStruct(
CustomStruct()

class CustomClass {
    var property: Int
    let constantProperty: Int

    static var staticProperty = 10

    init() {
        self.property = 1
        self.constantProperty = 2
//        self
//        Self
    }

    func multiply() -> Int {
        return 4
    }
}
CustomClass().multiply()

class Cake {
    var color: Int

    lazy var lazyProperty: Int = {
        return 0
    }()

    var computedProperty: Int = {
        let one = 5
        let two = 10
        return one + two
    }()

    init(color: Int) {
        self.color = color
    }
}

let order = Cake(color: 0)
order.lazyProperty

let object = CustomClass()
object.property
CustomClass.staticProperty

class Empty {
    var property: Int = 6

    init(value: Int) {
        let one = 3
        let two = 3

        self.property = one + two
    }
}

Empty(value: 6)



//Stored properties - must be initialized when class or struct are initialized
// +Lazy
// +Optional
//
//Computed properties

// Stored properties in class and structs


//: Initialization


// what is self? Self?
class MyClass {
    static func staticMethod() {
    }

    func instanceMethod() {
//        self.instanceMethod()
        Self.staticMethod()
    }
}
// Swift provides a default initializer for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself.
// .init
// Advanced - Designated Initializers and Convenience Initializers

//: Methods
//Instance
//Class(Static) Classes can use the class keyword instead, to allow subclasses to override the superclass’s implementation of that method.

//Override (class)

//Mutating (for structs) - Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.

//: Subscript
//for advanced



//: ## Задание:
//: * [App Development with Swift](https://books.apple.com/by/book/app-development-with-swift/id1465002990) **Units 1.1-1.4, 2.1-2.4** - Обязательно + тесты
//: * Подготовить интерпретацию иерархии видов животных в коде (класс-семейство-вид) подробно описать их свойства и функции
//: *
